import 'dart:ui';
import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:catering/Presentation/Home/tabs/bookings_tab.dart';
import 'package:catering/Presentation/Home/tabs/chat_list_tab.dart';
import 'package:catering/Presentation/Home/tabs/dashboard_tab.dart';
import 'package:catering/Presentation/Home/tabs/services_tab.dart';
import 'package:catering/Presentation/Home/tabs/staff_tab.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:catering/core/injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const DashboardTab(),
    const BookingsTab(),
    const ServicesTab(),
    const StaffTab(),
    const ChatListTab(),
  ];

  @override
  void initState() {
    super.initState();
    _initSession();
  }

  void _initSession() async {
    final tokenService = getIt<TokenService>();
    final email = await tokenService.getEmail();
    if (email != null && mounted) {
      final cubit = context.read<OwnerCubit>();
      
      // Sync device ID (FCM token) and fetch details sequentially
      await cubit.syncFCMToken();
      await cubit.fetchDetails();
      
      // Parallel fetch for remaining data
      Future.wait([
        cubit.fetchBookings(),
        cubit.fetchServices(),
        cubit.fetchStaff(),
        cubit.fetchRecentConversations(),
      ]);

      final user = cubit.state.ownerDetails.fold(() => null, (u) => u);
      
      cubit.setupSocket(email, user?.id, (msg) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg, style: const TextStyle(color: Colors.white)),
              backgroundColor: AppTheme.ownerAccent,
              behavior: SnackBarBehavior.floating,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppTheme.premiumGradient),
          ),
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.ownerAccent.withOpacity(0.12),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: Container(),
              ),
            ),
          ),
          IndexedStack(index: _currentIndex, children: _tabs),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 30),
      decoration: AppTheme.luxuryGlass(opacity: 0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppTheme.ownerAccent,
            unselectedItemColor: Colors.white24,
            selectedLabelStyle: GoogleFonts.outfit(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: GoogleFonts.outfit(
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_rounded),
                label: "HOME",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_rounded),
                label: "ORDERS",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_rounded),
                label: "SERVICES",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_rounded),
                label: "SQUAD",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_rounded),
                label: "CHAT",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
