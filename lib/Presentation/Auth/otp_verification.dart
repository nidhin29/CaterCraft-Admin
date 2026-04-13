import 'dart:async';
import 'package:catering/Application/signin/signin_cubit.dart';
import 'package:catering/Presentation/Home/owner_home.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerificationPage extends StatefulWidget {
  final String email;
  const OtpVerificationPage({super.key, required this.email});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  Timer? _timer;
  int _secondsRemaining = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
    // Automatically send initial OTP on entry
    context.read<SigninCubit>().sendOtp(widget.email);
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 60;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        setState(() => _canResend = true);
        timer.cancel();
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otp => _controllers.map((c) => c.text).join();

  void _onVerify() {
    if (_otp.length == 6) {
      context.read<SigninCubit>().verifyOtp(widget.email, _otp);
    } else {
      displaySnackBar(context: context, text: "Please enter all 6 digits");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          state.isFailureOrSuccess.fold(
            () => null,
            (either) => either.fold(
              (failure) => displaySnackBar(context: context, text: "Invalid or expired OTP"),
              (success) {
                if (success.accessToken != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const OwnerHomeScreen()),
                    (route) => false,
                  );
                }
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: AppTheme.premiumGradient),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  _buildHeader(),
                  const SizedBox(height: 60),
                  _buildOtpInput(),
                  const SizedBox(height: 40),
                  _buildTimer(),
                  const SizedBox(height: 60),
                  _buildVerifyButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white10),
          ),
          child: const Icon(Icons.mark_email_read_outlined, size: 64, color: AppTheme.ownerAccent),
        ),
        const SizedBox(height: 24),
        Text(
          "Verify Email",
          style: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 12),
        Text(
          "Code sent to ${widget.email}",
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 14, color: Colors.white60),
        ),
      ],
    );
  }

  Widget _buildOtpInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          width: 50,
          height: 60,
          decoration: AppTheme.luxuryGlass(opacity: 0.05),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.ownerAccent),
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                _focusNodes[index + 1].requestFocus();
              } else if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
              if (_otp.length == 6) {
                _onVerify();
              }
            },
          ),
        );
      }),
    );
  }

  Widget _buildTimer() {
    return Column(
      children: [
        if (!_canResend)
          Text(
            "Resend in $_secondsRemaining seconds",
            style: const TextStyle(color: Colors.white38),
          ),
        if (_canResend)
          TextButton(
            onPressed: () {
              context.read<SigninCubit>().sendOtp(widget.email);
              _startTimer();
            },
            child: const Text(
              "RESEND CODE",
              style: TextStyle(color: AppTheme.ownerAccent, fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
          ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return BlocBuilder<SigninCubit, SigninState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                AppTheme.ownerAccent,
                AppTheme.ownerAccent.withOpacity(0.8),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.ownerAccent.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: state.isVerifyingOtp ? null : _onVerify,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: state.isVerifyingOtp
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                : Text(
                    "VERIFY & CONTINUE",
                    style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
          ),
        );
      },
    );
  }
}
