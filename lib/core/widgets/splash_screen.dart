import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.gr.dart';
import 'package:fogshield_dealer_connect/core/utils/storage_service.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  bool _hasNavigated = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // 1. Add Lifecycle Observer to listen for App Pause/Resume events
    WidgetsBinding.instance.addObserver(this);
    _setFullScreen();
    _initializeAndPlay();
  }

  @override
  void dispose() {
    // 2. Remove Lifecycle Observer
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _restoreSystemUI();
    super.dispose();
  }

  // 3. Handle App Lifecycle Changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_isInitialized) return;

    // If app is backgrounded (Paused), pause the video
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _controller.pause();
    }
    // If app returns to foreground (Resumed), play the video
    else if (state == AppLifecycleState.resumed) {
      _controller.play();
    }
  }

  void _setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );
  }

  void _restoreSystemUI() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
  }

  Future<void> _initializeAndPlay() async {
    _controller = VideoPlayerController.asset('assets/icons/logo_video.mp4');

    try {
      await _controller.initialize();

      // Check login status asynchronously while preparing video
      final bool isLoggedIn = await SecureStorageService.isLoggedIn();

      // Hydrate Riverpod state if logged in so AuthGuard works correctly
      if (isLoggedIn && mounted) {
        try {
          await ref.read(authProvider.notifier).checkAuthStatus();
        } catch (e) {
          debugPrint("Auth hydration failed: $e");
        }
      }

      if (mounted && !_hasNavigated) {
        setState(() {
          _isInitialized = true;
        });

        _controller.setLooping(false);
        await _controller.play();

        // Video duration logic
        await Future.delayed(const Duration(milliseconds: 6500));

        if (mounted && !_hasNavigated) {
          _navigateToNext(isLoggedIn);
        }
      }
    } catch (e) {
      debugPrint("Splash Video Error: $e");

      // Fallback logic if video fails
      if (mounted && !_hasNavigated) {
        final bool isLoggedIn = await SecureStorageService.isLoggedIn();
        if (isLoggedIn && mounted) {
          try {
            await ref.read(authProvider.notifier).checkAuthStatus();
          } catch (_) {}
        }

        await Future.delayed(const Duration(milliseconds: 3500));

        if (mounted && !_hasNavigated) {
          _navigateToNext(isLoggedIn);
        }
      }
    }
  }

  void _navigateToNext(bool isLoggedIn) {
    _hasNavigated = true;
    _restoreSystemUI();

    // 4. Use replaceAll to strictly remove Splash from the stack
    // This ensures that when the app is resumed later, this page is NO LONGER in the history.
    if (isLoggedIn) {
      context.router.replaceAll([const DashboardRoute()]);
    } else {
      context.router.replaceAll([const LoginRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isInitialized
          ? SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        ),
      )
          : Container(
        color: Colors.black,
      ),
    );
  }
}