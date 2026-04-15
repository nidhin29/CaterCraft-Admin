import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffTab extends StatefulWidget {
  const StaffTab({super.key});

  @override
  State<StaffTab> createState() => _StaffTabState();
}

class _StaffTabState extends State<StaffTab> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<OwnerCubit>().fetchStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Squad Management",
                style: GoogleFonts.outfit(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => _showAddStaffDialog(context),
                icon: const Icon(
                  Icons.person_add_alt_1_rounded,
                  color: AppTheme.ownerAccent,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Monitor and coordinate your catering specialists",
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: BlocConsumer<OwnerCubit, OwnerState>(
            listener: (context, state) {
              state.addStaffFailureOrSuccess.fold(
                () => null,
                (either) => either.fold(
                  (failure) {
                    displaySnackBar(
                      context: context,
                      text: "Failed to add staff member",
                    );
                    context.read<OwnerCubit>().clearAddStaffStatus();
                  },
                  (success) {
                    Navigator.pop(context); // Close dialog
                    displaySnackBar(
                      context: context,
                      text: "Staff member added successfully!",
                    );
                    context.read<OwnerCubit>().clearAddStaffStatus();
                  },
                ),
              );
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppTheme.ownerAccent),
                );
              }
              if (state.staffList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline_rounded,
                        size: 64,
                        color: Colors.white10,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "No staff assignments yet",
                        style: TextStyle(color: Colors.white38),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: state.staffList.length,
                itemBuilder:
                    (context, index) =>
                        _staffCard(context, state.staffList[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showAddStaffDialog(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final designationController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 24,
              right: 24,
              top: 24,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ADD TEAM MEMBER",
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Create credentials for your new staff member",
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                    const SizedBox(height: 32),
                    _formField(
                      "Full Name",
                      Icons.person_outline,
                      nameController,
                    ),
                    const SizedBox(height: 16),
                    _formField(
                      "Email Address",
                      Icons.alternate_email,
                      emailController,
                    ),
                    const SizedBox(height: 16),
                    _formField(
                      "Designation (e.g. Lead Chef)",
                      Icons.work_outline,
                      designationController,
                    ),
                    const SizedBox(height: 16),
                    _formField(
                      "Login Password",
                      Icons.lock_outline,
                      passwordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 40),
                    BlocBuilder<OwnerCubit, OwnerState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed:
                                state.isSubmitting
                                    ? null
                                    : () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<OwnerCubit>().addStaff(
                                          fullName: nameController.text.trim(),
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                          designation:
                                              designationController.text.trim(),
                                        );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.ownerAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child:
                                state.isSubmitting
                                    ? const CircularProgressIndicator(
                                      color: Colors.black,
                                    )
                                    : Text(
                                      "ADD TO SQUAD",
                                      style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _formField(
    String label,
    IconData icon,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white38, fontSize: 13),
        prefixIcon: Icon(
          icon,
          color: AppTheme.ownerAccent.withOpacity(0.5),
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (v) => v!.isEmpty ? "Required" : null,
    );
  }

  Widget _staffCard(BuildContext context, UserModel staff) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: AppTheme.luxuryGlass(opacity: 0.05),
      child: ListTile(
        onTap: () => _showStaffDetails(context, staff),
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child:
                staff.profileImageThumbnail != null
                    ? Image.network(
                      staff.profileImageThumbnail!,
                      fit: BoxFit.cover,
                    )
                    : const Icon(Icons.person_rounded, color: Colors.white70),
          ),
        ),
        title: Text(
          staff.designation ?? "Team Member",
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          staff.fullName ?? staff.name ?? "Specialist",
          style: const TextStyle(
            color: AppTheme.ownerAccent,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white12,
          size: 16,
        ),
      ),
    );
  }

  void _showStaffDetails(BuildContext context, UserModel staff) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.ownerAccent, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.ownerAccent.withOpacity(0.2),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child:
                          staff.profileImage != null
                              ? Image.network(
                                staff.profileImage!,
                                fit: BoxFit.cover,
                              )
                              : const Icon(
                                Icons.person_rounded,
                                color: Colors.white,
                                size: 50,
                              ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    staff.fullName ?? staff.name ?? "Specialist",
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    staff.designation ?? "Team Member",
                    style: const TextStyle(
                      color: AppTheme.ownerAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _detailRow(Icons.alternate_email, "Email", staff.email),
                  _detailRow(Icons.fingerprint, "Staff ID", staff.id ?? "N/A"),
                  _detailRow(
                    Icons.verified_user_outlined,
                    "Status",
                    staff.isEmailVerified == true
                        ? "Email Verified"
                        : "Pending Verification",
                    textColor:
                        staff.isEmailVerified == true
                            ? Colors.greenAccent
                            : Colors.orangeAccent,
                  ),
                  if (staff.createdAt != null)
                    _detailRow(
                      Icons.calendar_today_outlined,
                      "Joined",
                      staff.createdAt!.split('T').first,
                    ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            "CLOSE",
                            style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            // TODO: Navigate to Chat with staff.id
                            displaySnackBar(
                              context: context,
                              text: "Opening chat with ${staff.fullName}...",
                            );
                          },
                          icon: const Icon(
                            Icons.chat_bubble_outline_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                          label: const Text(
                            "CHAT",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.ownerAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _detailRow(
    IconData icon,
    String label,
    String value, {
    Color? textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white24, size: 20),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: textColor ?? Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
