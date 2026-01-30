import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.gr.dart';

@RoutePage()
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

      if (mounted && !_hasNavigated) {
        setState(() {
          _isInitialized = true;
        });

        _controller.setLooping(false);
        await _controller.play();

        // Video logic preserved: 6.5s delay
        await Future.delayed(const Duration(milliseconds: 6500));

        if (mounted && !_hasNavigated) {
          _hasNavigated = true;
          _restoreSystemUI();

          // AutoRoute: replaceAll ensures user can't go back to splash
          context.router.replaceAll([const LoginRoute()]);
        }
      }
    } catch (e) {
      debugPrint("Splash Video Error: $e");
      if (mounted && !_hasNavigated) {
        await Future.delayed(const Duration(milliseconds: 3500));
        if (mounted && !_hasNavigated) {
          _hasNavigated = true;
          _restoreSystemUI();
          context.router.replaceAll([const LoginRoute()]);
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