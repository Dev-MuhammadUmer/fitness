import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/HomeScreen/Widgets/full_screen_video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControls extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  final double videoSpeed;
  final Function togglePlayPause;
  final Function setPlaybackSpeed;

  const VideoPlayerControls({
    super.key,
    required this.controller,
    required this.isPlaying,
    required this.videoSpeed,
    required this.togglePlayPause,
    required this.setPlaybackSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            activeColor: AppColors.greenColor,
            value: controller.value.position.inSeconds.toDouble(),
            min: 0,
            max: controller.value.duration.inSeconds.toDouble(),
            onChanged: (value) {
              controller.seekTo(Duration(seconds: value.toInt()));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: AppColors.whiteColor,
                ),
                onPressed: () => togglePlayPause(),
              ),
              Text(
                "${_formatDuration(controller.value.position)} / ${_formatDuration(controller.value.duration)}",
                style: const TextStyle(color: AppColors.whiteColor),
              ),
              DropdownButton<double>(
                dropdownColor: AppColors.blackColor,
                value: videoSpeed,
                items: [0.5, 1.0, 1.5, 2.0].map((speed) {
                  return DropdownMenuItem(
                    value: speed,
                    child: Text(
                      "${speed}x",
                      style: const TextStyle(color: AppColors.whiteColor),
                    ),
                  );
                }).toList(),
                onChanged: (value) => setPlaybackSpeed(value),
              ),
              IconButton(
                icon: const Icon(
                  Icons.fullscreen,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        FullScreenVideoPlayer(controller: controller),
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
