import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.dart';
import 'package:fogshield_dealer_connect/core/theme/app_theme.dart';

class fogshieldApp extends ConsumerWidget {
  const fogshieldApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Watch the router provider so changes in auth state trigger redirection
    final router = ref.watch(routerProvider);

    const Color bottomAreaColor = Colors.white;

    return MaterialApp.router(
      title: 'Fogshield Dealer Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      // ✅ Use the config provided by Riverpod
      routerConfig: router,
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
