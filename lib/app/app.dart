import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.dart';
import 'package:fogshield_dealer_connect/core/services/data_sync_service.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/utils/logger_service.dart';
import 'package:fogshield_dealer_connect/core/theme/app_theme.dart';

// Changed to ConsumerStatefulWidget to handle Lifecycle events
class fogshieldApp extends ConsumerStatefulWidget {
  const fogshieldApp({super.key});

  @override
  ConsumerState<fogshieldApp> createState() => _fogshieldAppState();
}

class _fogshieldAppState extends ConsumerState<fogshieldApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    // Register this class to listen to app lifecycle changes (Background/Foreground)
    WidgetsBinding.instance.addObserver(this);

    // 1. Run Sync on App Initialization
    // We use addPostFrameCallback to wait for the widget tree to be ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoggerService.i("🚀 App Initialized: Triggering Background Sync...");
      ref.read(syncServiceProvider).performBackgroundSync();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 2. Run Sync when app resumes (comes back from background)
    // This handles the "Try again when it is in background" scenario effectively
    // by retrying the moment the user returns to the app.
    if (state == AppLifecycleState.resumed) {
      LoggerService.i("🔄 App Resumed: Retrying Pending Syncs...");
      ref.read(syncServiceProvider).performBackgroundSync();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the router provider
    final appRouter = ref.watch(appRouterProvider);

    const Color bottomAreaColor = AppColors.zincLight;

    return MaterialApp.router(
      title: 'Fogshield Dealer Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,

      // Use AutoRoute configuration
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