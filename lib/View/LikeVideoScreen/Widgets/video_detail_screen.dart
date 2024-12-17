import 'package:fitness/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// The VideoDetails class is already defined in your other file,
// you can either import it or redefine it here if necessary.

// Make sure to import your VideoDetails class if it's defined elsewhere.
import 'package:fitness/View/LikeVideoScreen/like_video_screen.dart';

class VideoDetailsScreen extends StatelessWidget {
  final VideoDetails videoDetails;

  const VideoDetailsScreen({super.key, required this.videoDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text(
          videoDetails.videoName,
          style: TextStyle(color: AppColors.whiteColor, fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              videoDetails.thumbnailUrl,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.h),
            Text(
              videoDetails.videoDescription,
              style: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
