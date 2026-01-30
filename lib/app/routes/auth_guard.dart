import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;
  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // 1. Read the current auth state
    final authState = ref.read(authProvider);

    // 2. Check status
    if (authState.status == AuthStatus.authenticated) {
      // Allow navigation to proceed
      resolver.next(true);
    } else {
      // Redirect to Login if not authenticated
      router.push(const LoginRoute());
    }
  }
}