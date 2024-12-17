import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/DetailsScreen/description_screen.dart';
import 'package:fitness/View/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget buildCategoryVideos(String category, List<VideoDetails> videos) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => print("Category: $category"),
              child: Text(
                "See All",
                style: TextStyle(
                  color: AppColors.redColor,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 200.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescriptionScreen(
                      selectedVideo: videos[index], // Pass the selected video
                      relatedVideos: videos, // Pass the related videos list
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Stack(
                  children: <Widget>[
                    // Video Thumbnail Container
                    Container(
                      height: 250.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          image: AssetImage(videos[index].thumbnailUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Video Details Positioned at Bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              videos[index].videoName,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              videos[index].duration.inMinutes > 0
                                  ? '${videos[index].duration.inMinutes} mins'
                                  : 'Free',
                              style: TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Circular Percent Indicator Positioned Bottom-Right
                    Positioned(
                      bottom: 10.h,
                      right: 20.w,
                      child: CircularPercentIndicator(
                        radius: 25.0,
                        lineWidth: 4.0,
                        percent: 0.8, // Example value (80% progress)
                        center: Text(
                          "80%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        progressColor: AppColors.redColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
