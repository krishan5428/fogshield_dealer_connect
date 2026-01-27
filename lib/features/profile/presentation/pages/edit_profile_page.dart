import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_text_field.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_snackbar.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/profile_picture_picker.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _companyController;
  late TextEditingController _addressController;
  late TextEditingController _gstController;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileProvider);
    _nameController = TextEditingController(text: profile.name);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phone);
    _companyController = TextEditingController(text: profile.companyName);
    _addressController = TextEditingController(text: profile.address);
    _gstController = TextEditingController(text: profile.gstNumber);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _addressController.dispose();
    _gstController.dispose();
    super.dispose();
  }

  void _saveChanges() async {
    if (_formKey.currentState!.validate()) {
// The updateProfile method now handles persistent storage internally
      await ref.read(profileProvider.notifier).updateProfile(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        companyName: _companyController.text,
        address: _addressController.text,
        gstNumber: _gstController.text,
      );

      if (mounted) {
        CustomSnackbar.showSuccess(
          context: context,
          title: 'Profile Updated',
          message: 'Your changes have been saved securely.',
        );
        Navigator.pop(context);
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const ProfilePicturePicker(),
              const SizedBox(height: 32),
              CustomTextField(
                label: 'Full Name',
                controller: _nameController,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Email Address',
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Phone Number',
                controller: _phoneController,
                prefixIcon: Icons.phone_android,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Company Name',
                controller: _companyController,
                prefixIcon: Icons.business,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'GST Number',
                hint: 'e.g. 07AAAAA0000A1Z5',
                controller: _gstController,
                prefixIcon: Icons.receipt_long_outlined,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Address',
                controller: _addressController,
                prefixIcon: Icons.location_on_outlined,
                maxLines: 3,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'SAVE CHANGES',
                onPressed: _saveChanges,
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: 'CANCEL',
                isOutlined: true,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}