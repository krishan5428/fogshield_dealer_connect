import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _hasNavigated = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _setFullScreen();
    _initializeAndPlay();
  }

  void _setFullScreen() {
    // Set fullscreen immersive mode
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );
  }

  void _restoreSystemUI() {
    // Restore system UI when leaving splash
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
  }

  Future<void> _initializeAndPlay() async {
    _controller = VideoPlayerController.asset('assets/icons/logo_video.mp4');

    try {
      // Initialize the video
      await _controller.initialize();

      if (mounted && !_hasNavigated) {
        setState(() {
          _isInitialized = true;
        });

        // Set video to not loop
        _controller.setLooping(false);

        // Start playing
        await _controller.play();

        // Wait for exactly 3500ms
        await Future.delayed(const Duration(milliseconds: 6500));

        // Navigate after 3.5 seconds
        if (mounted && !_hasNavigated) {
          _hasNavigated = true;
          _restoreSystemUI();

          // Use pushReplacement to prevent going back to splash
          context.pushReplacement(RouteNames.login);
        }
      }
    } catch (e) {
      debugPrint("Splash Video Error: $e");
      // Fallback: wait 3.5 seconds then navigate
      if (mounted && !_hasNavigated) {
        await Future.delayed(const Duration(milliseconds: 3500));
        if (mounted && !_hasNavigated) {
          _hasNavigated = true;
          _restoreSystemUI();
          context.pushReplacement(RouteNames.login);
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _restoreSystemUI();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Remove SafeArea to make it fullscreen
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
        // Show black screen while initializing
      ),
    );
  }
}