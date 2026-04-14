import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Application/loggedin/loggedin_cubit.dart';
import 'package:catering/Presentation/Auth/signin.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OwnerCubit>().fetchDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerCubit, OwnerState>(
      builder: (context, state) {
        final owner = state.ownerDetails.fold(() => null, (u) => u);

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white70,
                size: 20,
              ),
            ),
            title: Text(
              owner?.role == 2 ? "STAFF PROFILE" : "BUSINESS PROFILE",
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (owner != null) {
                    _showUpdateProfileDialog(context, owner);
                  }
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white70,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(gradient: AppTheme.premiumGradient),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    // Profile Image / Logo
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.ownerAccent.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.05),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child:
                              (owner != null &&
                                      (owner.profileImage ??
                                              owner.companyLogo) !=
                                          null)
                                  ? CachedNetworkImage(
                                    imageUrl:
                                        owner.role == 2
                                            ? (owner.profileImage ?? "")
                                            : (owner.companyLogo ?? ""),
                                    fit: BoxFit.cover,
                                    placeholder:
                                        (context, url) => const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                    errorWidget:
                                        (context, url, error) => const Icon(
                                          Icons.account_circle_outlined,
                                          size: 40,
                                          color: Colors.white24,
                                        ),
                                  )
                                  : const Icon(
                                    Icons.account_circle_outlined,
                                    size: 40,
                                    color: Colors.white24,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      owner?.role == 2
                          ? (owner?.fullName ?? "STAFF MEMBER")
                          : (owner?.companyName ?? "BUSINESS OWNER"),
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Status Badge removed as requested
                    const SizedBox(height: 48),
                    _buildInfoCard("Account Details", [
                      _infoRow("Name", owner?.fullName ?? owner?.name ?? "N/A"),
                      _infoRow("Email", owner?.email ?? "N/A"),
                      _infoRow(
                        "Company",
                        owner?.role == 2
                            ? (owner?.ownerInfo?.companyName ?? "N/A")
                            : (owner?.companyName ?? "N/A"),
                      ),
                      _infoRow("Member Since", "April 2026"),
                    ]),
                    // Update Password is a ONE-TIME onboarding step exclusively for Staff (role 2)
                    if (owner?.role == 2 &&
                        owner?.isPasswordUpdated != true) ...[
                      const SizedBox(height: 32),
                      _buildInfoCard("Security & Settings", [
                        _actionRow(
                          context,
                          "Update Password",
                          Icons.lock_outline_rounded,
                          onTap: () => _showUpdatePasswordDialog(context),
                        ),
                      ]),
                    ],
                    const SizedBox(height: 48),
                    // Log out
                    _logoutButton(context),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: AppTheme.glassDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppTheme.ownerAccent,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white54, fontSize: 13),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionRow(
    BuildContext context,
    String label,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.ownerAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 18, color: AppTheme.ownerAccent),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.white24,
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdatePasswordDialog(BuildContext context) {
    final oldController = TextEditingController();
    final newController = TextEditingController();
    final confirmController = TextEditingController();
    bool isUpdating = false;

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setDialogState) => AlertDialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 24),
                  contentPadding: EdgeInsets.zero,
                  content: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppTheme.cardColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withOpacity(0.1)),
                        ),
                        child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.8,
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SECURE IDENTITY",
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.ownerAccent,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Update Password",
                              style: GoogleFonts.outfit(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _dialogTextField(
                              "Current Password",
                              oldController,
                              true,
                            ),
                            const SizedBox(height: 16),
                            _dialogTextField(
                              "New Password",
                              newController,
                              true,
                            ),
                            const SizedBox(height: 16),
                            _dialogTextField(
                              "Confirm New Password",
                              confirmController,
                              true,
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed:
                                    isUpdating
                                        ? null
                                        : () async {
                                          if (newController.text !=
                                              confirmController.text) {
                                            displaySnackBar(
                                              context: context,
                                              text:
                                                  "New passwords do not match",
                                            );
                                            return;
                                          }
                                          if (newController.text.length < 6) {
                                            displaySnackBar(
                                              context: context,
                                              text:
                                                  "Password must be at least 6 characters",
                                            );
                                            return;
                                          }
                                          setDialogState(
                                            () => isUpdating = true,
                                          );
                                          final result = await context
                                              .read<OwnerCubit>()
                                              .updatePassword(
                                                oldPassword: oldController.text,
                                                newPassword: newController.text,
                                              );
                                          setDialogState(
                                            () => isUpdating = false,
                                          );

                                          if (mounted) {
                                            if (result.isRight()) {
                                              context
                                                  .read<OwnerCubit>()
                                                  .fetchDetails(); // Refresh to hide the button
                                              Navigator.of(context).pop();
                                              displaySnackBar(
                                                context: context,
                                                text:
                                                    "Password updated successfully",
                                              );
                                            } else {
                                              displaySnackBar(
                                                context: context,
                                                text:
                                                    "Failed to update password. Please check your current password.",
                                              );
                                            }
                                          }
                                        },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.ownerAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child:
                                    isUpdating
                                        ? const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        )
                                        : Text(
                                          "CONFIRM CHANGE",
                                          style: GoogleFonts.outfit(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                            color: Colors.black,
                                          ),
                                        ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Center(
                                child: Text(
                                  "CANCEL",
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }

  Widget _dialogTextField(
    String label,
    TextEditingController controller,
    bool obscure,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _logoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: () {
          context.read<LoggedinCubit>().clearSession();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
          );
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.redAccent, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          "SIGN OUT ACCOUNT",
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  void _showUpdateProfileDialog(BuildContext context, UserModel owner) {
    final isStaff = owner.role == 2;
    final nameController = TextEditingController(text: isStaff ? owner.fullName : owner.companyName);
    File? selectedImage;
    bool isUpdating = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          contentPadding: EdgeInsets.zero,
          content: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ACCOUNT SETTINGS",
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.ownerAccent,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Update Profile",
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            setDialogState(() => selectedImage = File(image.path));
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(color: AppTheme.ownerAccent.withOpacity(0.5), width: 2),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: selectedImage != null
                              ? Image.file(selectedImage!, fit: BoxFit.cover)
                              : ((isStaff ? owner.profileImage : owner.companyLogo) != null)
                                  ? CachedNetworkImage(
                                      imageUrl: (isStaff ? owner.profileImage! : owner.companyLogo!),
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(Icons.add_a_photo_outlined, size: 32, color: Colors.white70),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        isStaff ? "Upload Profile Image" : "Upload Company Logo",
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _dialogTextField(
                      isStaff ? "Full Name" : "Company Name",
                      nameController,
                      false,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: isUpdating
                            ? null
                            : () async {
                                if (nameController.text.trim().isEmpty) {
                                  displaySnackBar(context: context, text: "Name field is required");
                                  return;
                                }
                                setDialogState(() => isUpdating = true);
                                
                                if (isStaff) {
                                  await context.read<OwnerCubit>().updateProfile(
                                        fullName: nameController.text.trim(),
                                        profileImage: selectedImage,
                                      );
                                } else {
                                  await context.read<OwnerCubit>().updateProfile(
                                        companyName: nameController.text.trim(),
                                        logo: selectedImage,
                                      );
                                }
                                setDialogState(() => isUpdating = false);

                                if (mounted) {
                                  context.read<OwnerCubit>().fetchDetails();
                                  Navigator.of(context).pop();
                                  displaySnackBar(context: context, text: "Profile updated successfully");
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.ownerAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: isUpdating
                            ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                            : Text(
                                "SAVE CHANGES",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Center(
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),),)   
    );
  }
}
