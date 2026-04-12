import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookingDetailScreen extends StatelessWidget {
  final BookingModel booking;
  final bool isOwner;

  const BookingDetailScreen({
    super.key,
    required this.booking,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 32),
                  _buildDetailSection("Customer Details", [
                    _detailRow(Icons.email_outlined, booking.customerEmail),
                    _detailRow(Icons.calendar_today_outlined, _formatDate(booking.dateTime)),
                  ]),
                  const SizedBox(height: 32),
                  _buildDetailSection("Service Details", [
                    _detailRow(Icons.restaurant_menu_outlined, booking.service.name),
                    _detailRow(Icons.description_outlined, booking.service.description ?? "No description provided"),
                    _detailRow(Icons.currency_rupee, "${booking.service.rate} / person"),
                  ]),
                  const SizedBox(height: 32),
                  if (isOwner) _buildPaymentStatus(),
                  if (!isOwner) _buildStaffTasks(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: booking.id ?? "",
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (booking.service.image != null)
                Image.network(
                  booking.service.image!,
                  fit: BoxFit.cover,
                )
              else
                Container(color: AppTheme.cardColor),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                booking.service.name,
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            _statusBadge(booking.status),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Booking ID: #${booking.id?.substring(0, 8).toUpperCase() ?? "N/A"}",
          style: GoogleFonts.outfit(color: Colors.white38, fontSize: 14),
        ),
      ],
    );
  }

  Widget _statusBadge(String status) {
    final color = status == "Confirmed" ? Colors.greenAccent : Colors.orangeAccent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _detailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: isOwner ? AppTheme.ownerAccent : AppTheme.staffAccent),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentStatus() {
    final hasPaid = booking.razorpayOrderId != null;
    return _buildDetailSection("Payment Awareness", [
      Row(
        children: [
          Icon(
            hasPaid ? Icons.check_circle : Icons.pending_actions,
            color: hasPaid ? Colors.greenAccent : Colors.redAccent,
          ),
          const SizedBox(width: 12),
          Text(
            hasPaid ? "Deposit Paid" : "Payment Pending",
            style: TextStyle(
              color: hasPaid ? Colors.greenAccent : Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      if (hasPaid) ...[
        const SizedBox(height: 12),
        Text(
          "Order ID: ${booking.razorpayOrderId}",
          style: const TextStyle(color: Colors.white38, fontSize: 12),
        ),
      ],
    ]);
  }

  Widget _buildStaffTasks() {
    return _buildDetailSection("Checklist", [
      _taskItem("Prepare Ingredients", true),
      _taskItem("Setup Venue", false),
      _taskItem("Serve Food", false),
      _taskItem("Cleanup", false),
    ]);
  }

  Widget _taskItem(String task, bool isDone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: isDone ? AppTheme.staffAccent : Colors.white24,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            task,
            style: TextStyle(
              color: isDone ? Colors.white54 : Colors.white,
              decoration: isDone ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('EEE, d MMM yyyy - hh:mm a').format(date);
    } catch (e) {
      return dateStr;
    }
  }
}
