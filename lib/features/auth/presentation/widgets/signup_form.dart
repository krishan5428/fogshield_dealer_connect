import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_text_field.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/utils/validators.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // 1. Added Dealer Code Controller
  final _dealerCodeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dealerCodeController.dispose(); // Dispose the new controller
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      ref.read(authProvider.notifier).signup(
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        password: _passwordController.text,
        // 2. Pass the dealer code to your signup method
        dealerCode: _dealerCodeController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Full Name',
            hint: 'Enter your name',
            controller: _nameController,
            prefixIcon: Icons.person_outline_rounded,
            validator: Validators.name,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Mobile Number',
            hint: 'Enter 10 digit number',
            controller: _phoneController,
            prefixIcon: Icons.phone_android_rounded,
            keyboardType: TextInputType.phone,
            validator: Validators.phone,
          ),
          const SizedBox(height: 16),
          // 3. Added Dealer Code TextField (Required)
          CustomTextField(
            label: 'Dealer Code',
            hint: 'Enter your unique dealer code',
            controller: _dealerCodeController,
            prefixIcon: Icons.vignette_outlined,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Dealer code is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Email Address',
            hint: 'dealer@fogshield.com',
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Password',
            hint: 'Min. 6 characters',
            controller: _passwordController,
            prefixIcon: Icons.lock_outline_rounded,
            isPassword: true,
            validator: Validators.password,
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: 'CREATE ACCOUNT',
            isLoading: state.status == AuthStatus.loading,
            onPressed: _handleSignup,
          ),
        ],
      ),
    );
  }
}