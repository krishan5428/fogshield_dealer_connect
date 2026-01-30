import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.dart';
import 'package:fogshield_dealer_connect/core/theme/app_theme.dart';

class fogshieldApp extends ConsumerWidget {
  const fogshieldApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Watch the router provider
    final appRouter = ref.watch(appRouterProvider);

    const Color bottomAreaColor = Colors.white;

    return MaterialApp.router(
      title: 'Fogshield Dealer Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,

      // 2. Use AutoRoute configuration
      routerConfig: appRouter.config(),

      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: bottomAreaColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Container(
            color: bottomAreaColor,
            child: SafeArea(
              top: false,
              bottom: true,
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}