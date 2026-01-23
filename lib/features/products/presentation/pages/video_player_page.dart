import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class VideoPlayerPage extends StatefulWidget {
  final String? videoUrl;

  const VideoPlayerPage({super.key, this.videoUrl});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      setState(() {
        _errorMessage = "No video URL provided";
        _isLoading = false;
      });
      return;
    }

    try {
      // Convert standard Google Drive view link to a direct stream link
      String finalUrl = widget.videoUrl!;
      if (finalUrl.contains('drive.google.com')) {
        // Extract the File ID using RegExp
        final regExp = RegExp(r'\/d\/([a-zA-Z0-9_-]+)');
        final match = regExp.firstMatch(finalUrl);
        if (match != null && match.groupCount >= 1) {
          final fileId = match.group(1);
          // Use the direct download/stream URL for Google Drive
          finalUrl = 'https://drive.google.com/uc?export=download&id=$fileId';
        }
      }

      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(finalUrl));

      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.colorCompanyPrimary,
          handleColor: AppColors.colorCompanyPrimary,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.white.withOpacity(0.5),
        ),
        placeholder: Container(
          color: Colors.black,
          child: const Center(child: LoadingIndicator()),
        ),
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Could not load video: $e";
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(
        title: 'Video Player',
      ),
      body: Center(
        child: _isLoading
            ? const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingIndicator(),
            SizedBox(height: 16),
            Text(
              "Buffering video...",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        )
            : _errorMessage != null
            ? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                  _initializePlayer();
                },
                child: const Text("Retry"),
              )
            ],
          ),
        )
            : AspectRatio(
          aspectRatio: _videoPlayerController!.value.aspectRatio,
          child: Chewie(controller: _chewieController!),
        ),
      ),
    );
  }
}