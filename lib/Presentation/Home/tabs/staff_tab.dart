import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
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
          child: Text(
            "Squad Management",
            style: GoogleFonts.outfit(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
          child: BlocBuilder<OwnerCubit, OwnerState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator(color: AppTheme.ownerAccent));
              }
              if (state.staffList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people_outline_rounded, size: 64, color: Colors.white10),
                      const SizedBox(height: 16),
                      const Text("No staff assignments yet", style: TextStyle(color: Colors.white38)),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: state.staffList.length,
                itemBuilder: (context, index) => _staffCard(context, state.staffList[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _staffCard(BuildContext context, UserModel staff) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: AppTheme.luxuryGlass(opacity: 0.05),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: const Icon(Icons.person_rounded, color: Colors.white70),
        ),
        title: Text(
          staff.name ?? "Specialist",
          style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          staff.email,
          style: const TextStyle(color: Colors.white38, fontSize: 13),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("AVAILABLE", style: TextStyle(color: Colors.greenAccent, fontSize: 9, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
