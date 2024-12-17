import 'dart:async';
import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/DetailsScreen/Widgets/video_controls.dart';
import 'package:fitness/View/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final VideoDetails selectedVideo;
  final List<VideoDetails> matchedVideos;

  const VideoScreen({
    super.key,
    required this.selectedVideo,
    required this.matchedVideos,
  });

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late VideoDetails _currentVideo;
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  double _videoSpeed = 1.0;
  bool _showControls = true;
  Timer? _hideTimer;
  bool _isFavorite = false; // To track whether the video is liked or not

  @override
  void initState() {
    super.initState();
    _currentVideo = widget.selectedVideo;

    // Initialize the video controller using networkUrl
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.selectedVideo.videoUrl))
      ..initialize().then((_) {
        setState(() {}); // Rebuild to show video once initialized
        _controller.play();
        _isPlaying = true;
      })
      ..addListener(() {
        setState(() {}); // Update UI on state changes
      });

    _startHideTimer();
  }

  @override
  void dispose() {
    // Dispose the controller and timer
    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // Play a selected video
  void _playVideo(VideoDetails video) {
    setState(() {
      _currentVideo = video;
      _controller.pause(); // Pause current video before switching
      _controller = VideoPlayerController.networkUrl(Uri.parse(video.videoUrl))
        ..initialize().then((_) {
          setState(() {
            _controller.play();
            _isPlaying = true;
          });
        });
    });
  }

  // Toggle Play/Pause functionality
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

  // Set playback speed
  void _setPlaybackSpeed(double? speed) {
    if (speed != null) {
      setState(() {
        _controller.setPlaybackSpeed(speed);
        _videoSpeed = speed;
      });
    }
  }

  // Toggle controls visibility
  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _startHideTimer();
    }
  }

  // Start timer to hide controls
  void _startHideTimer() {
    _hideTimer?.cancel(); // Cancel existing timer
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (_controller.value.isPlaying) {
        setState(() {
          _showControls = false; // Hide controls after 3 seconds
        });
      }
    });
  }

  // Format duration to hh:mm:ss
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  // Toggle favorite status (like/dislike)
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        // AppBar background color
        backgroundColor: AppColors.blackColor,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
      ),
      body: GestureDetector(
        onTap: _toggleControls, // Toggle visibility of controls when tapped
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // Container background color
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 150.h,
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
                            child: VideoControls(
                              controller: _controller,
                              isPlaying: _isPlaying,
                              videoSpeed: _videoSpeed,
                              togglePlayPause: _togglePlayPause,
                              setPlaybackSpeed: _setPlaybackSpeed,
                              formatDuration: _formatDuration,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // Row with "Description" and Favorite Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        // Text color
                        color: AppColors.whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite
                            ? AppColors.redColor
                            : AppColors.greyColor,
                        size: 24.sp,
                      ),
                      onPressed: _toggleFavorite, // Toggle favorite state
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  _currentVideo.videoDescription,
                  style: TextStyle(
                    // Text color
                    color: AppColors.whiteColor,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  children: List.generate(widget.matchedVideos.length, (index) {
                    var video = widget.matchedVideos[index];
                    return InkWell(
                      onTap: () {
                        _playVideo(video); // Play the selected video
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                          color: _currentVideo == video
                              ? AppColors.redColor // Highlight current video
                              : AppColors.transparentColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: AppColors.blackColor,
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: AssetImage(video.thumbnailUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  video.videoName,
                                  style: TextStyle(
                                    // Text color
                                    color: AppColors.whiteColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _formatDuration(video.duration),
                                  style: TextStyle(
                                    // Text color
                                    color: AppColors.greyColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
