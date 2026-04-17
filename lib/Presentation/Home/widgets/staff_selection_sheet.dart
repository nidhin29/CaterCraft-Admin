import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffSelectionSheet extends StatefulWidget {
  final List<String> initialSelectedIds;
  final Function(List<String>) onSelected;

  const StaffSelectionSheet({
    super.key,
    required this.initialSelectedIds,
    required this.onSelected,
  });

  @override
  State<StaffSelectionSheet> createState() => _StaffSelectionSheetState();
}

class _StaffSelectionSheetState extends State<StaffSelectionSheet> {
  late List<String> _selectedIds;

  @override
  void initState() {
    super.initState();
    _selectedIds = List.from(widget.initialSelectedIds);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: BlocBuilder<OwnerCubit, OwnerState>(
        builder: (context, state) {
          final staffList = state.staffList;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ASSIGN STAFF",
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onSelected(_selectedIds);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "DONE",
                      style: GoogleFonts.outfit(
                        color: AppTheme.ownerAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Select staff members for this event",
                style: TextStyle(color: Colors.white54, fontSize: 13),
              ),
              const SizedBox(height: 24),
              if (state.isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: CircularProgressIndicator(color: AppTheme.ownerAccent),
                  ),
                )
              else if (staffList.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "No staff members available",
                      style: TextStyle(color: Colors.white24),
                    ),
                  ),
                )
              else
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: staffList.length,
                    itemBuilder: (context, index) {
                      final staff = staffList[index];
                      final isSelected = _selectedIds.contains(staff.id);

                      return _staffTile(staff, isSelected);
                    },
                  ),
                ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  Widget _staffTile(UserModel staff, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedIds.remove(staff.id);
          } else {
            _selectedIds.add(staff.id!);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.ownerAccent.withOpacity(0.05) : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.ownerAccent.withOpacity(0.3) : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
                border: Border.all(
                  color: isSelected ? AppTheme.ownerAccent : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: staff.profileImageThumbnail != null
                    ? Image.network(staff.profileImageThumbnail!, fit: BoxFit.cover)
                    : const Icon(Icons.person_rounded, color: Colors.white38, size: 24),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    staff.fullName ?? "Staff Member",
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    staff.designation ?? "Team Member",
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (val) {
                setState(() {
                  if (isSelected) {
                    _selectedIds.remove(staff.id);
                  } else {
                    _selectedIds.add(staff.id!);
                  }
                });
              },
              activeColor: AppTheme.ownerAccent,
              checkColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ),
    );
  }
}
