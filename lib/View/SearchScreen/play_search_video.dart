import 'dart:async';

import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/SearchScreen/Widgets/controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class PlaySearchVideo extends StatefulWidget {
  const PlaySearchVideo({
    super.key,
  });

  @override
  PlaySearchVideoState createState() => PlaySearchVideoState();
}

class PlaySearchVideoState extends State<PlaySearchVideo> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = true;
  double _videoSpeed = 1.0;
  late Timer _hideTimer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
            'https://videos.pexels.com/video-files/4745810/4745810-uhd_2560_1440_25fps.mp4') // Replace with actual video URL
        )
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _isPlaying = true;
        });
      })
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _hideTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
      _startHideTimer();
    });
  }

  void _setPlaybackSpeed(double? speed) {
    if (speed != null) {
      setState(() {
        _controller.setPlaybackSpeed(speed);
        _videoSpeed = speed;
      });
    }
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _startHideTimer();
    }
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (_controller.value.isPlaying) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        title: Text(
          "Sample Video",
          style: TextStyle(fontSize: 16.sp, color: AppColors.whiteColor),
        ),
      ),
      body: GestureDetector(
        onTap: _toggleControls,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : const Center(
                              child: SpinKitFadingCircle(
                                color: AppColors.whiteColor,
                              ),
                            ),
                    ),
                    if (_showControls && _controller.value.isInitialized)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SearchVideoControls(
                          controller: _controller,
                          isPlaying: _isPlaying,
                          onPlayPause: _togglePlayPause,
                          onSpeedChange: _setPlaybackSpeed,
                          currentSpeed: _videoSpeed,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
