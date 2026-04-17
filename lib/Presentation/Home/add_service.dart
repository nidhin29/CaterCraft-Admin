import 'dart:io';
import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _rateController = TextEditingController();
  final _durationController = TextEditingController();
  final _descController = TextEditingController();
  File? _image;
  String _selectedGroup = 'wedding';

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
      ),
      body: BlocConsumer<OwnerCubit, OwnerState>(
        listener: (context, state) {
          state.serviceFailureOrSuccess.fold(
            () => null,
            (either) => either.fold(
              (f) => displaySnackBar(context: context, text: "Failed to add service"),
              (s) {
                displaySnackBar(context: context, text: "Service added successfully!");
                Navigator.pop(context);
              },
            ),
          );
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imagePickerSection(),
                  const SizedBox(height: 30),
                  _buildLabel("Service Name"),
                  _textField(_nameController, "e.g. Premium Buffet", Icons.restaurant),
                  const SizedBox(height: 20),
                  _buildLabel("Service Group"),
                  _dropdownField(),
                  const SizedBox(height: 20),
                  _buildLabel("Rate (per person)"),
                  _textField(_rateController, "e.g. 1500", Icons.attach_money, isNumber: true),
                  const SizedBox(height: 20),
                  _buildLabel("Duration"),
                  _textField(_durationController, "e.g. 4 Hours", Icons.timer),
                  const SizedBox(height: 20),
                  _buildLabel("Description"),
                  _textField(_descController, "Detailed service description...", Icons.description, maxLines: 4),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                if (_image == null) {
                                  displaySnackBar(context: context, text: "Please select an image");
                                  return;
                                }
                                context.read<OwnerCubit>().addService(
                                      name: _nameController.text,
                                      rate: double.parse(_rateController.text),
                                      duration: _durationController.text,
                                      description: _descController.text,
                                      image: _image!,
                                      serviceGroup: _selectedGroup,
                                    );
                              }
                            },
                      child: state.isSubmitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("PUBLISH SERVICE"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _imagePickerSection() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10),
        ),
        child: _image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(_image!, fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_a_photo_outlined, size: 40, color: Colors.white30),
                  SizedBox(height: 12),
                  Text("Upload Service Image", style: TextStyle(color: Colors.white30)),
                ],
              ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget _textField(TextEditingController controller, String hint, IconData icon,
      {bool isNumber = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.white30),
        contentPadding: const EdgeInsets.all(20),
      ),
      validator: (v) => v!.isEmpty ? "Required" : null,
    );
  }

  Widget _dropdownField() {
    return DropdownButtonFormField<String>(
      value: _selectedGroup,
      dropdownColor: AppTheme.cardColor,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.category, color: Colors.white30),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      items: ["wedding", "corporate", "parties", "global"]
          .map((group) => DropdownMenuItem(
                value: group,
                child: Text(
                  group[0].toUpperCase() + group.substring(1),
                  style: GoogleFonts.outfit(color: Colors.white),
                ),
              ))
          .toList(),
      onChanged: (val) {
        if (val != null) {
          setState(() => _selectedGroup = val);
        }
      },
    );
  }
}
