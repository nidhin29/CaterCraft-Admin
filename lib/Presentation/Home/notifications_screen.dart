import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Domain/Notification/notification_model.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Notifications", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: AppTheme.premiumGradient)),
          BlocBuilder<OwnerCubit, OwnerState>(
            builder: (context, state) {
              if (state.notifications.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_off_outlined, size: 64, color: Colors.white10),
                      const SizedBox(height: 16),
                      Text("No notifications yet", style: TextStyle(color: Colors.white24)),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, kToolbarHeight + 40, 20, 20),
                itemCount: state.notifications.length,
                itemBuilder: (context, index) => _notificationCard(state.notifications[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _notificationCard(NotificationModel notification) {
    IconData icon;
    Color iconColor;

    switch (notification.type) {
      case 'booking':
        icon = Icons.event_available_rounded;
        iconColor = Colors.blueAccent;
        break;
      case 'service':
        icon = Icons.inventory_2_rounded;
        iconColor = Colors.orangeAccent;
        break;
      default:
        icon = Icons.info_outline_rounded;
        iconColor = Colors.cyanAccent;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.luxuryGlass(opacity: 0.08),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Text(
          notification.title,
          style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(notification.message, style: const TextStyle(color: Colors.white54, fontSize: 13)),
            const SizedBox(height: 8),
            Text(
              DateFormat('h:mm a · MMM d').format(notification.timestamp),
              style: TextStyle(color: Colors.white24, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
