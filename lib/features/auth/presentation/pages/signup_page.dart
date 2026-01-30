import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/widgets/auth_header.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/widgets/signup_form.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_snackbar.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      // Handle error state - stay on signup page and show error
      if (next.status == AuthStatus.error) {
        // Only show toast if error message changed or status just became error
        if (previous?.status != AuthStatus.error || previous?.errorMessage != next.errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomSnackbar.showError(
              context: context,
              title: 'Registration Failed',
              message: next.errorMessage ?? 'An error occurred',
            );

            // Clear error state so user can try again
            ref.read(authProvider.notifier).clearError();
          });
        }
      }

      // Handle successful signup - show success and navigate to login
      if (next.status == AuthStatus.signedUp) {
        // Only navigate once
        if (previous?.status != AuthStatus.signedUp) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Show success toast
            CustomSnackbar.showSuccess(
              context: context,
              title: 'Success!',
              message: 'Account created successfully. Please login.',
            );

            // Wait a moment for toast to show, then navigate
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                // Clear signedUp state
                ref.read(authProvider.notifier).clearSignedUp();

                // Navigate to login using go (not pushReplacement)
                context.go(RouteNames.login);
              }
            });
          });
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              children: [
                const AuthHeader(
                  title: 'Join FogSHIELD',
                  subtitle: '',
                ),
                const SignupForm(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "OR",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.disabledGrey),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.colorCompanyPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "By signing up, you agree to our Terms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.disabledGrey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}