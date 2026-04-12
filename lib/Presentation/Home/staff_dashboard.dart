import 'dart:ui';
import 'package:catering/Application/Staff/staff_cubit.dart';
import 'package:catering/Presentation/Home/profile.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:catering/core/injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffDashboard extends StatefulWidget {
  const StaffDashboard({super.key});

  @override
  State<StaffDashboard> createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final tokenService = getIt<TokenService>();
    final email = await tokenService.getEmail();
    if (email != null) {
      if (mounted) {
        context.read<StaffCubit>().fetchAssignedBookings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Gradient
          Container(decoration: BoxDecoration(gradient: AppTheme.premiumGradient)),
          
          // Subtle Aura Glows
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.staffAccent.withOpacity(0.1),
              ),
              child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80), child: Container()),
            ),
          ),

          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildWelcomeHeader(),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Icon(Icons.assignment_rounded, color: AppTheme.staffAccent.withOpacity(0.7), size: 18),
                          const SizedBox(width: 8),
                          Text(
                            "TODAY'S MISSIONS",
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              _buildTasksList(),
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen())),
        icon: const Icon(Icons.account_circle_outlined, color: Colors.white70, size: 28),
      ),
      actions: [
        IconButton(
          onPressed: () => _loadData(),
          icon: const Icon(Icons.sync_rounded, color: AppTheme.staffAccent),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildWelcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Field Operations",
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.staffAccent.withOpacity(0.7),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Ready for Service?",
          style: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _buildTasksList() {
    return BlocBuilder<StaffCubit, StaffState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: AppTheme.staffAccent)));
        }
        if (state.bookings.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.task_alt_rounded, size: 64, color: Colors.white.withOpacity(0.1)),
                  const SizedBox(height: 16),
                  const Text("All clear! No tasks today.", style: TextStyle(color: Colors.white38)),
                ],
              ),
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _eventTaskCard(state.bookings[index]),
              childCount: state.bookings.length,
            ),
          ),
        );
      },
    );
  }

  Widget _eventTaskCard(dynamic booking) {
    final completedTasks = context.watch<StaffCubit>().state.completedTasks[booking.id] ?? [];
    final allTasks = ["Kitchen Prep", "Venue Setup", "Service", "Standard Cleanup"];
    final progress = completedTasks.length / allTasks.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: AppTheme.luxuryGlass(opacity: 0.08),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          tilePadding: const EdgeInsets.all(20),
          title: Text(
            booking.service.name,
            style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _cardInfoRow(Icons.place_rounded, booking.customerEmail),
              const SizedBox(height: 8),
              _cardInfoRow(Icons.access_time_filled_rounded, "18:00 - 22:00"),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(height: 6, decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(10))),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    height: 6,
                    width: MediaQuery.of(context).size.width * 0.5 * progress,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [AppTheme.staffAccent, AppTheme.staffAccent.withOpacity(0.5)]),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: AppTheme.staffAccent.withOpacity(0.3), blurRadius: 8)],
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: _buildTrailingIndicator(progress == 1.0),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: allTasks.map((task) {
                  final isDone = completedTasks.contains(task);
                  return _taskCheckbox(booking.id!, task, isDone);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppTheme.staffAccent.withOpacity(0.6)),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 12, color: Colors.white54, overflow: TextOverflow.ellipsis))),
      ],
    );
  }

  Widget _buildTrailingIndicator(bool complete) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: (complete ? Colors.greenAccent : AppTheme.staffAccent).withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        complete ? Icons.check_circle_rounded : Icons.keyboard_arrow_down_rounded,
        color: complete ? Colors.greenAccent : AppTheme.staffAccent,
        size: 20,
      ),
    );
  }

  Widget _taskCheckbox(String bookingId, String task, bool isDone) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.read<StaffCubit>().toggleTask(bookingId, task),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isDone ? AppTheme.staffAccent : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: isDone ? AppTheme.staffAccent : Colors.white24, width: 2),
                ),
                child: isDone ? const Icon(Icons.check, size: 16, color: Colors.black) : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  task,
                  style: GoogleFonts.outfit(
                    color: isDone ? Colors.white30 : Colors.white70,
                    fontSize: 15,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
