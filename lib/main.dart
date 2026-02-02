import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/app/app.dart';

import 'core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Force status bar styling globally
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.zincLight, // black
      statusBarIconBrightness: Brightness.light, // ANDROID -> icons white
      statusBarBrightness: Brightness.dark, // IOS -> text white
    ),
  );

  // ✅ This prevents Flutter from re-adjusting status bar colors automatically
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(
    const ProviderScope(
      child: fogshieldApp(),
    ),
  );
}
