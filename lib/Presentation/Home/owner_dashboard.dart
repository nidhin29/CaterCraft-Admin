import 'dart:ui';
import 'package:catering/Presentation/Home/profile.dart';
import 'package:catering/Presentation/Home/add_service.dart';
import 'package:catering/Presentation/Home/booking_detail.dart';
import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Presentation/Auth/signin.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:catering/core/injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerDashboard extends StatefulWidget {
  const OwnerDashboard({super.key});

  @override
  State<OwnerDashboard> createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
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
        context.read<OwnerCubit>().fetchBookings();
        context.read<OwnerCubit>().setupSocket(email, (msg) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg, style: const TextStyle(color: Colors.white)),
              backgroundColor: AppTheme.ownerAccent,
              behavior: SnackBarBehavior.floating,
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          // Background Gradient
          Container(decoration: BoxDecoration(gradient: AppTheme.premiumGradient)),
          
          // Subtle Aura Glows
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.ownerAccent.withOpacity(0.15),
              ),
              child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100), child: Container()),
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
                      _buildStatSection(),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Bookings",
                            style: GoogleFonts.outfit(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("See All", style: TextStyle(color: AppTheme.ownerAccent.withOpacity(0.8))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              _buildBookingsList(),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 28),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => context.read<OwnerCubit>().fetchBookings(),
          icon: const Icon(Icons.refresh_rounded, color: Colors.white70),
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
          "CaterCraft HQ",
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.ownerAccent.withOpacity(0.7),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Welcome back, Captain",
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

  Widget _buildStatSection() {
    return Row(
      children: [
        _statBlock("Active Ev.", "12", Icons.dashboard_customize_rounded, AppTheme.statusConfirmed),
        const SizedBox(width: 20),
        _statBlock("Req. Appr.", "05", Icons.pending_actions_rounded, AppTheme.statusPending),
      ],
    );
  }

  Widget _statBlock(String label, String value, IconData icon, Color accentColor) {
    return Expanded(
      child: Container(
        height: 160,
        decoration: AppTheme.luxuryGlass(opacity: 0.08),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Positioned(
                bottom: -20,
                right: -20,
                child: Icon(icon, size: 100, color: Colors.white.withOpacity(0.03)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: accentColor, size: 24),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value,
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          label,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: Colors.white54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingsList() {
    return BlocBuilder<OwnerCubit, OwnerState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: AppTheme.ownerAccent)));
        }
        if (state.bookings.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event_busy_rounded, size: 64, color: Colors.white.withOpacity(0.1)),
                  const SizedBox(height: 16),
                  const Text("No bookings found", style: TextStyle(color: Colors.white38)),
                ],
              ),
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _bookingCard(state.bookings[index]),
              childCount: state.bookings.length,
            ),
          ),
        );
      },
    );
  }

  Widget _bookingCard(dynamic booking) {
    final bool isConfirmed = booking.status == "Confirmed";
    final Color statusColor = isConfirmed ? AppTheme.statusConfirmed : AppTheme.statusPending;

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
            child: Row(
              children: [
                _buildServiceIcon(isConfirmed),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.service.name,
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
          ),
        ),
      ),
    );
  }

  Widget _buildServiceIcon(bool active) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: active ? AppTheme.ownerAccent.withOpacity(0.1) : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        Icons.local_dining_rounded,
        color: active ? AppTheme.ownerAccent : Colors.white30,
        size: 26,
      ),
    );
  }

  Widget _buildStatusChip(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        status.toUpperCase(),
        style: GoogleFonts.outfit(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton.extended(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AddServiceScreen()),
      ),
      backgroundColor: AppTheme.ownerAccent,
      elevation: 8,
      icon: const Icon(Icons.add_rounded, color: Colors.white),
      label: Text(
        "NEW PACKAGE",
        style: GoogleFonts.outfit(fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }

  Widget _buildDrawer() {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
      child: Drawer(
        backgroundColor: AppTheme.darkBackground.withOpacity(0.95),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: AppTheme.premiumGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: AppTheme.ownerAccent.withOpacity(0.3), blurRadius: 20, spreadRadius: 5),
                      ],
                    ),
                    child: const Icon(Icons.restaurant_menu_rounded, size: 40, color: Colors.white),
                  ),
                ),
              ),
              _drawerItem(Icons.person_outline_rounded, "Company Profile", () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
              }),
              _drawerItem(Icons.analytics_outlined, "Business Insights", () {}),
              _drawerItem(Icons.settings_outlined, "Global Settings", () {}),
              const Spacer(),
              _drawerItem(Icons.logout_rounded, "Switch Account", () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              }, isDestructive: true),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: Icon(icon, color: isDestructive ? Colors.redAccent.withOpacity(0.8) : Colors.white60),
      title: Text(
        title,
        style: GoogleFonts.outfit(
          color: isDestructive ? Colors.redAccent.withOpacity(0.8) : Colors.white70,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
