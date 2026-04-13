import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListTab extends StatefulWidget {
  const ChatListTab({super.key});

  @override
  State<ChatListTab> createState() => _ChatListTabState();
}

class _ChatListTabState extends State<ChatListTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Communications Hub",
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
            "Coordinate with your staff in real-time",
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
                      Icon(Icons.chat_bubble_outline_rounded, size: 64, color: Colors.white10),
                      const SizedBox(height: 16),
                      const Text("No active chats", style: TextStyle(color: Colors.white38)),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: state.staffList.length,
                itemBuilder: (context, index) => _chatItem(context, state.staffList[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _chatItem(BuildContext context, dynamic staff) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: AppTheme.luxuryGlass(opacity: 0.05),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24),
              ),
              child: const Icon(Icons.person_rounded, color: Colors.white70),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.darkBackground, width: 2),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          staff.name ?? "Specialist",
          style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: const Text(
          "Stable connection established",
          style: TextStyle(color: Colors.white38, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.ownerAccent.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.send_rounded, color: AppTheme.ownerAccent, size: 16),
        ),
      ),
    );
  }
}
