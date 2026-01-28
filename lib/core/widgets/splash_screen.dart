import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    // Path to your splash video asset
    _controller = VideoPlayerController.asset('assets/icons/logo_video.mp4');

    try {
      await _controller.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        _controller.setLooping(false);
        _controller.play();

        // Updated delay to exactly 3500 ms
        await Future.delayed(const Duration(milliseconds: 3500));

        if (mounted) {
          // Navigate to the login screen
          // Note: The router's redirect logic will automatically skip this
          // to the dashboard if a session is already active.
          context.go(RouteNames.login);
        }
      }
    } catch (e) {
      debugPrint("Splash Video Error: $e");
      // Fallback navigation in case of initialization error
      await Future.delayed(const Duration(milliseconds: 3500));
      if (mounted) context.go(RouteNames.login);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Sleek black background for video splash
      body: Center(
        child: _isInitialized
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
            : const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}