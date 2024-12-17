import 'package:fitness/View/DetailsScreen/video_screen.dart';
import 'package:fitness/View/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness/Constants/colors.dart';

class DescriptionScreen extends StatelessWidget {
  final VideoDetails selectedVideo;
  final List<VideoDetails> relatedVideos;

  const DescriptionScreen({
    super.key,
    required this.selectedVideo,
    required this.relatedVideos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Thumbnail
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Image.asset(
                selectedVideo.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Video Title and Description
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedVideo.videoName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    selectedVideo.videoDescription,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),

            // Comments Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Text(
                    "Comments",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.greyColor),

            // Play All Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                children: [
                  const Icon(Icons.play_circle_fill,
                      color: AppColors.yellowColor),
                  SizedBox(width: 10.w),
                  Text(
                    "Play All",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${relatedVideos.length} videos",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),

            // Related Videos List
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                itemCount: relatedVideos.length,
                itemBuilder: (context, index) {
                  final video = relatedVideos[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoScreen(
                            selectedVideo: video,
                            matchedVideos: relatedVideos,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.asset(
                        video.thumbnailUrl,
                        width: 80.w,
                        height: 50.h,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        video.videoName,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      subtitle: Text(
                        "${video.duration.inMinutes.toString().padLeft(2, '0')}:${video.duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
