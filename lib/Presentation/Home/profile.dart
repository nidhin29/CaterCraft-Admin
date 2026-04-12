import 'package:catering/Application/loggedin/loggedin_cubit.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:catering/Presentation/Auth/signin.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:catering/core/injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? email;
  int? role;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    final tokenService = getIt<TokenService>();
    final e = await tokenService.getEmail();
    final r = await tokenService.getRole();
    setState(() {
      email = e;
      role = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppTheme.premiumGradient,
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: AppTheme.cardColor,
                  child: Icon(Icons.person, size: 60, color: Colors.white24),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              email ?? "Loading...",
              style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              role == 1 ? "Owner Account" : "Staff Member",
              style: TextStyle(
                color: role == 1 ? AppTheme.ownerAccent : AppTheme.staffAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            _buildOption(Icons.notifications_outlined, "Notifications"),
            _buildOption(Icons.security_outlined, "Security"),
            _buildOption(Icons.help_outline, "Help & Support"),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showLogoutDialog(context),
                icon: const Icon(Icons.logout, color: Colors.redAccent),
                label: const Text("LOGOUT", style: TextStyle(color: Colors.redAccent)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.glassDecoration(),
      child: ListTile(
        leading: Icon(icon, color: Colors.white54),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right, color: Colors.white24),
        onTap: () {},
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CANCEL", style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              context.read<LoggedinCubit>().clearSession();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text("LOGOUT", style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }
}
