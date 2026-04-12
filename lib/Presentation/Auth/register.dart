import 'dart:io';
import 'package:catering/Application/signin/signin_cubit.dart';
import 'package:catering/Presentation/Auth/signin.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _licenseFile;

  Future<void> _pickLicense() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _licenseFile = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppTheme.premiumGradient),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    "JOIN CATERCRAFT",
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: AppTheme.glassDecoration(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _textField(controller: nameController, label: "Business Name", icon: Icons.business),
                          const SizedBox(height: 20),
                          _textField(controller: emailController, label: "Email", icon: Icons.email_outlined),
                          const SizedBox(height: 20),
                          _textField(controller: passwordController, label: "Password", icon: Icons.lock_outline, isPassword: true),
                          const SizedBox(height: 30),
                          
                          // License Upload
                          InkWell(
                            onTap: _pickLicense,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white24, style: BorderStyle.solid),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.upload_file, color: _licenseFile != null ? Colors.greenAccent : Colors.white54),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      _licenseFile != null ? _licenseFile!.path.split('/').last : "Upload Business License (PDF/Image)",
                                      style: TextStyle(color: _licenseFile != null ? Colors.white : Colors.white30),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() && _licenseFile != null) {
                                  context.read<SigninCubit>().registerOwner(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim(),
                                        license: _licenseFile!,
                                      );
                                } else if (_licenseFile == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Please upload your business license")),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.ownerAccent),
                              child: const Text("REGISTER AS OWNER", style: TextStyle(fontWeight: FontWeight.bold)),
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
                                if (nameController.text.isNotEmpty && _licenseFile != null) {
                                  context.read<SigninCubit>().googleRegister(
                                        businessName: nameController.text.trim(),
                                        license: _licenseFile!,
                                      );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Please enter Business Name and upload License first")),
                                  );
                                }
                              },
                              icon: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png",
                                height: 20,
                              ),
                              label: const Text("REGISTER WITH GOOGLE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1)),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white.withOpacity(0.1)),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            ),
                            child: const Text("Already have an account? Sign In", style: TextStyle(color: Colors.white54)),
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
      ),
    );
  }

  Widget _textField({required TextEditingController controller, required String label, required IconData icon, bool isPassword = false}) {
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
