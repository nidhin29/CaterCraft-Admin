import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Presentation/Home/booking_detail.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsTab extends StatelessWidget {
  const BookingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Event Pipeline",
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
            "Manage your scheduled catering events",
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
              if (state.bookings.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.event_note_rounded, size: 64, color: Colors.white10),
                      const SizedBox(height: 16),
                      const Text("No bookings yet", style: TextStyle(color: Colors.white38)),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: state.bookings.length,
                itemBuilder: (context, index) => _bookingCard(context, state.bookings[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Approved":
      case "Accepted": return AppTheme.statusApproved;
      case "In Kitchen": return AppTheme.statusKitchen;
      case "Dispatched": return AppTheme.statusDispatched;
      case "Completed":
      case "Confirmed": return AppTheme.statusConfirmed;
      case "Cancelled": return AppTheme.statusCancelled;
      default: return AppTheme.statusPending;
    }
  }

  Widget _bookingCard(BuildContext context, BookingModel booking) {
    final Color statusColor = _getStatusColor(booking.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: AppTheme.luxuryGlass(opacity: 0.05),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BookingDetailScreen(booking: booking, isOwner: true),
            ),
          ),
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.calendar_today_rounded, color: statusColor, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.service.name,
                          style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          booking.customerEmail,
                          style: const TextStyle(color: Colors.white38, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusChip(booking.status, statusColor),
                ],
              ),
              if (booking.paymentStatus == "Paid")
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Earning: ₹${(booking.ownerPayout ?? (booking.service.rate * 0.9)).toStringAsFixed(0)} (Net)",
                    style: GoogleFonts.outfit(color: AppTheme.ownerAccent, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildStatusChip(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        status.toUpperCase(),
        style: GoogleFonts.outfit(color: color, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }
}
