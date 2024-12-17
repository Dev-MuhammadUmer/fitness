import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SearchVideoControls extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  final Function onPlayPause;
  final Function(double?) onSpeedChange;
  final double currentSpeed;

  const SearchVideoControls({
    super.key,
    required this.controller,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onSpeedChange,
    required this.currentSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            activeColor: Colors.green,
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
                  color: Colors.white,
                ),
                onPressed: () => onPlayPause(),
              ),
              Text(
                "${_formatDuration(controller.value.position)} / ${_formatDuration(controller.value.duration)}",
                style: const TextStyle(color: Colors.white),
              ),
              DropdownButton<double>(
                dropdownColor: Colors.black,
                value: currentSpeed,
                items: [0.5, 1.0, 1.5, 2.0].map((speed) {
                  return DropdownMenuItem<double>(
                    value: speed,
                    child: Text(
                      "${speed}x",
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: onSpeedChange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
