import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Domain/Service/service_model.dart';
import 'package:catering/Presentation/Home/add_service.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<OwnerCubit>().fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service Suite",
                style: GoogleFonts.outfit(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddServiceScreen()),
                ),
                icon: const Icon(Icons.add_circle_rounded, color: AppTheme.ownerAccent, size: 36),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Manage your professional catering packages",
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
              if (state.services.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2_rounded, size: 64, color: Colors.white10),
                      const SizedBox(height: 16),
                      const Text("No services created yet", style: TextStyle(color: Colors.white38)),
                    ],
                  ),
                );
              }
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: state.services.length,
                itemBuilder: (context, index) => _serviceCard(context, state.services[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _serviceCard(BuildContext context, ServiceModel service) {
    return Container(
      decoration: AppTheme.luxuryGlass(opacity: 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: service.image != null
                    ? Image.network(service.image!, fit: BoxFit.cover)
                    : const Icon(Icons.image_rounded, color: Colors.white24, size: 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  "₹${service.rate}",
                  style: const TextStyle(color: AppTheme.ownerAccent, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
