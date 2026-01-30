import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/widgets/auth_header.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/widgets/login_form.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_snackbar.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _hasShownError = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      // Handle error state
      if (next.status == AuthStatus.error && !_hasShownError) {
        _hasShownError = true;

        // Show error toast
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomSnackbar.showError(
            context: context,
            title: 'Login Failed',
            message: next.errorMessage ?? 'Invalid credentials',
          );

          // Clear error state after showing toast
          ref.read(authProvider.notifier).clearError();
        });
      }

      // Reset error flag when leaving error state
      if (previous?.status == AuthStatus.error && next.status != AuthStatus.error) {
        _hasShownError = false;
      }

      // Handle successful authentication
      if (next.status == AuthStatus.authenticated) {
        context.go(RouteNames.dashboard);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AuthHeader(
                  title: 'Welcome',
                  subtitle: 'Login to your account to continue',
                ),
                const SizedBox(height: 40),
                const LoginForm(),
                const SizedBox(height: 32),
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
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => context.push(RouteNames.signup),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.colorCompanyPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}