import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Presentation/Home/notifications_screen.dart';
import 'package:catering/Presentation/Home/profile.dart';
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen())),
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white70, size: 28),
          ),
          title: Text(
            "COMMUB",
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationsScreen())),
              icon: const Icon(Icons.notifications_none_rounded, color: Colors.white70, size: 28),
            ),
            const SizedBox(width: 8),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Communications Hub",
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Coordinate with your team in real-time",
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: BlocBuilder<OwnerCubit, OwnerState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator(color: AppTheme.ownerAccent));
              }

              final ownerData = state.ownerDetails.fold(() => null, (u) => u);
              final isStaff = ownerData?.role == 2;

              if (isStaff) {
                final ownerInfo = ownerData?.ownerInfo;
                if (ownerInfo == null) {
                  return const Center(child: Text("Connecting to Office...", style: TextStyle(color: Colors.white38)));
                }
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  children: [
                    _chatItem(
                      context,
                      name: ownerInfo.companyName ?? "Business Owner",
                      subtitle: "Direct line to Headquarters",
                    ),
                  ],
                );
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
                itemBuilder: (context, index) => _chatItem(
                  context,
                  name: state.staffList[index].fullName ?? state.staffList[index].name ?? "Staff",
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _chatItem(BuildContext context, {required String name, String subtitle = "Stable connection established"}) {
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
          name,
          style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white38, fontSize: 12),
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
