import 'package:catering/Application/signin/signin_cubit.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Presentation/Home/owner_dashboard.dart';
import 'package:catering/Presentation/Home/staff_dashboard.dart';
import 'package:catering/Presentation/Auth/register.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _selectedRole = 1; // 1 for Owner, 2 for Staff

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          state.isFailureOrSuccess.fold(
            () => null,
            (either) => either.fold(
              (failure) {
                if (!state.isLoading) {
                  String message = "Something unexpected happened";
                  if (failure == const MainFailure.serverFailure()) {
                    message = "Server is down";
                  } else if (failure == const MainFailure.authFailure()) {
                    message = "Please check the email address";
                  } else if (failure == const MainFailure.incorrectCredential()) {
                    message = "Incorrect Password";
                  } else if (failure == const MainFailure.clientFailure()) {
                    message = "Something wrong with your network";
                  }
                  displaySnackBar(context: context, text: message);
                }
              },
              (success) {
                final role = _selectedRole;
                if (role == 1) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const OwnerDashboard()),
                    (route) => false,
                  );
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const StaffDashboard()),
                    (route) => false,
                  );
                }
              },
            ),
          );
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Background Gradient
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Header
                      Text(
                        "CATERCRAFT",
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "PREMIUM CATERING SOLUTIONS",
                        style: GoogleFonts.outfit(
                          color: Colors.white54,
                          fontSize: 10,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 60),

                      // Glassmorph Card
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white.withOpacity(0.1)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back",
                                style: GoogleFonts.outfit(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Sign in to continue managing your events",
                                style: GoogleFonts.outfit(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Role Selection
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    _roleTab("Owner", 1),
                                    _roleTab("Staff", 2),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),

                              // Fields
                              _textField(
                                controller: emailController,
                                label: "Email Address",
                                icon: Icons.alternate_email,
                              ),
                              const SizedBox(height: 20),
                              _textField(
                                controller: passwordController,
                                label: "Password",
                                icon: Icons.lock_outline,
                                isPassword: true,
                              ),
                              const SizedBox(height: 40),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: state.isLoading
                                      ? null
                                      : () {
                                          if (_formKey.currentState!.validate()) {
                                            context.read<SigninCubit>().signIn(
                                                  emailController.text.trim(),
                                                  passwordController.text.trim(),
                                                  _selectedRole,
                                                );
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _selectedRole == 1 
                                        ? Colors.blueAccent 
                                        : Colors.orangeAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: state.isLoading
                                      ? const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(Colors.white),
                                          ),
                                        )
                                      : Text(
                                          "SIGN IN",
                                          style: GoogleFonts.outfit(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Text("OR", style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 2)),
                                  ),
                                  Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    if (emailController.text.isNotEmpty) {
                                      context.read<SigninCubit>().googleLogin(emailController.text.trim());
                                    } else {
                                      displaySnackBar(context: context, text: "Please enter your email for Google verification");
                                    }
                                  },
                                  icon: Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png",
                                    height: 20,
                                  ),
                                  label: const Text("CONTINUE WITH GOOGLE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1)),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.white.withOpacity(0.1)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Preview Mode Button
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    if (_selectedRole == 1) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const OwnerDashboard()),
                                        (route) => false,
                                      );
                                    } else {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const StaffDashboard()),
                                        (route) => false,
                                      );
                                    }
                                  },
                                  child: Text(
                                    "PREVIEW DESIGN (GUEST)",
                                    style: GoogleFonts.outfit(
                                      color: Colors.white38,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Center(
                                child: TextButton(
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                                  ),
                                  child: Text(
                                    "NEW OWNER? REGISTER HERE",
                                    style: GoogleFonts.outfit(
                                      color: Colors.white30,
                                      fontSize: 10,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _roleTab(String label, int role) {
    final isSelected = _selectedRole == role;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedRole = role),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? (role == 1 ? Colors.blueAccent : Colors.orangeAccent) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.white24,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white30),
      ),
      validator: (v) => v!.isEmpty ? "Required" : null,
    );
  }
}
