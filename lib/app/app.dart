import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.dart';
import 'package:fogshield_dealer_connect/core/theme/app_theme.dart';

class fogshieldApp extends StatelessWidget {
  const fogshieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set your custom system bar/background color here
    const Color bottomAreaColor = Colors.white;

    return MaterialApp.router(
      title: 'Fogshield Dealer Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // ✅ allows UI behind status bar
            statusBarIconBrightness: Brightness.dark, // Android
            statusBarBrightness: Brightness.light, // iOS (opposite)
            systemNavigationBarColor: bottomAreaColor, // ✅ bottom area custom color
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Container(
            // ✅ This ensures bottom safe area shows your custom color
            color: bottomAreaColor,
            child: SafeArea(
              top: false,     // ✅ NOT safe from status bar
              bottom: true,   // ✅ safe only at bottom
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
