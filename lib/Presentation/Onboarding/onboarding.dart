import 'package:catering/Presentation/Auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: "Plan with Precision",
      description: "Manage your catering events with a sophisticated dashboard designed for high-end service.",
      icon: Icons.calendar_today_rounded,
    ),
    OnboardingData(
      title: "Lead with Confidence",
      description: "Empower your staff with real-time updates and seamless communication for every venue.",
      icon: Icons.groups_3_rounded,
    ),
    OnboardingData(
      title: "Execution Excellence",
      description: "Track bookings, manage services, and deliver unforgettable culinary experiences.",
      icon: Icons.restaurant_rounded,
    ),
  ];

  Future<void> _completeOnboarding() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('is_onboarded', true);
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with subtle movement effect
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _currentPage == 0 
                  ? [const Color(0xFF0F2027), const Color(0xFF203A43)] 
                  : _currentPage == 1 
                    ? [const Color(0xFF141E30), const Color(0xFF243B55)]
                    : [const Color(0xFF000000), const Color(0xFF434343)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          
          // PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _pages.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _OnboardingPage(data: _pages[index], isActive: _currentPage == index);
            },
          ),

          // Navigation Overlay (Bottom)
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: _currentPage == index ? 32 : 12,
                        decoration: BoxDecoration(
                          color: _currentPage == index ? Colors.white : Colors.white24,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: _currentPage == index ? [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            )
                          ] : [],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Primary Action Button
                  InkWell(
                    onTap: () {
                      if (_currentPage == _pages.length - 1) {
                        _completeOnboarding();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          _currentPage == _pages.length - 1 ? "ENTER CATERCRAFT" : "EXPLORE",
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Secondary Action (Skip)
                  const SizedBox(height: 12),
                  AnimatedOpacity(
                    opacity: _currentPage == _pages.length - 1 ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: IgnorePointer(
                      ignoring: _currentPage == _pages.length - 1,
                      child: TextButton(
                        onPressed: _completeOnboarding,
                        child: Text(
                          "SKIP PREVIEW",
                          style: GoogleFonts.outfit(
                            color: Colors.white38,
                            fontSize: 10,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final bool isActive;
  const _OnboardingPage({required this.data, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Icon Container
          AnimatedScale(
            scale: isActive ? 1.0 : 0.8,
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            child: AnimatedOpacity(
              opacity: isActive ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.03),
                      blurRadius: 100,
                      spreadRadius: 20,
                    )
                  ],
                ),
                child: Icon(data.icon, size: 100, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 80),
          
          // Animated Title
          AnimatedPadding(
            padding: EdgeInsets.only(top: isActive ? 0 : 40),
            duration: const Duration(milliseconds: 600),
            child: AnimatedOpacity(
              opacity: isActive ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                data.title.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Animated Description
          AnimatedOpacity(
            opacity: isActive ? 0.7 : 0.0,
            duration: const Duration(milliseconds: 800),
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 15,
                height: 1.8,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          // Spacer for bottom overlay safety
          const SizedBox(height: 180),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });
}
