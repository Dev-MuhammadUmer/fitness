// lib/models/video_details.dart

class VideoDetails {
  final String videoUrl;
  final String thumbnailUrl;
  final String videoName;
  final String videoDescription;
  final Duration duration;

  VideoDetails({
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.videoName,
    required this.videoDescription,
    required this.duration,
  });
}
