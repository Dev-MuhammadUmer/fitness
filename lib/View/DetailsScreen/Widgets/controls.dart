import 'package:fitness/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget buildControls({
  required VideoPlayerController controller,
  required bool isPlaying,
  required double videoSpeed,
  required VoidCallback togglePlayPause,
  required Function(double?) setPlaybackSpeed,
  required String Function(Duration) formatDuration,
}) {
  return Container(
    color: Colors.black54,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slider(
          activeColor: AppColors.greenColor,
          value: controller.value.position.inSeconds.toDouble(),
          min: 0,
          max: controller.value.duration.inSeconds.toDouble() > 0
              ? controller.value.duration.inSeconds.toDouble()
              : 1.0, // Avoid division by zero
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
              onPressed: togglePlayPause,
            ),
            Text(
              "${formatDuration(controller.value.position)} / ${formatDuration(controller.value.duration)}",
              style: const TextStyle(color: AppColors.whiteColor),
            ),
            PopupMenuButton<double>(
              initialValue: videoSpeed,
              onSelected: setPlaybackSpeed,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 0.5,
                  child: Text("0.5x"),
                ),
                const PopupMenuItem(
                  value: 1.0,
                  child: Text("1.0x"),
                ),
                const PopupMenuItem(
                  value: 1.5,
                  child: Text("1.5x"),
                ),
                const PopupMenuItem(
                  value: 2.0,
                  child: Text("2.0x"),
                ),
              ],
              child: Text(
                "${videoSpeed}x",
                style: const TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
