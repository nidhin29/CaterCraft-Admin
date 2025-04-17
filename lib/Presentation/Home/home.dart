import 'package:catering/Application/loggedin/loggedin_cubit.dart';
import 'package:catering/Presentation/Auth/signin.dart';
import 'package:catering/Presentation/Home/Bookings/booking.dart';
import 'package:catering/Presentation/Home/Customers/customers.dart';
import 'package:catering/Presentation/Home/Feedback/feedback.dart';
import 'package:catering/Presentation/Home/Teams/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildGridMenu(context),
            const SizedBox(height: 30),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade700,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, Admin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Manage your events",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Show logout confirmation dialog
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Confirm Logout"),
                          content: const Text(
                            "Are you sure you want to logout?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<LoggedinCubit>(
                                  context,
                                ).deleteEmail();
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: const Text("Logout"),
                            ),
                          ],
                        ),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                tooltip: "Logout",
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.admin_panel_settings,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridMenu(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.event_available, 'label': 'Bookings'},
      {'icon': Icons.groups, 'label': 'Team'},
      {'icon': Icons.people, 'label': 'Customers'},
      {'icon': Icons.feedback, 'label': 'Feedback'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        physics: const NeverScrollableScrollPhysics(),
        children:
            items.map((item) {
              return GestureDetector(
                onTap: () {
                  // Handle navigation based on item tapped
                  switch (item['label']) {
                    case 'Bookings':
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BookingPage(),
                        ),
                      );
                      break;
                    case 'Team':
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TeamViewPage(),
                        ),
                      );
                      break;
                    case 'Customers':
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CustomersPage(),
                        ),
                      );
                      break;
                    case 'Feedback':
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                      break;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'], size: 32, color: Colors.blueAccent),
                      const SizedBox(height: 12),
                      Text(
                        item['label'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
