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
    // Corrected path to assets/icons/logo_video.mp4 as per your setup
    _controller = VideoPlayerController.asset('assets/icons/logo_video.mp4');

    try {
      await _controller.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        _controller.setLooping(false);
        _controller.play();

        // Wait for exactly 2500 ms as requested
        await Future.delayed(const Duration(milliseconds: 2500));

        if (mounted) {
          // Navigate to the next screen (Login)
          context.go(RouteNames.login);
        }
      }
    } catch (e) {
      debugPrint("Splash Video Error: $e");
      // Fallback navigation in case of error (prevents getting stuck on loading)
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
      backgroundColor: Colors.black, // Recommended for video splash
      body: Center(
        child: _isInitialized
            ? SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover, // Cover the whole screen
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