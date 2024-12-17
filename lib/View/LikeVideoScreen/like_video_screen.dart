import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/LikeVideoScreen/Widgets/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LikedVideosScreen extends StatelessWidget {
  final List<VideoDetails> likedVideos = [
    VideoDetails(
      category: 'Category 1',
      thumbnailUrl: 'assets/images/gym1.jpg',
      type: 'Free',
      videoDescription: 'Description 1',
      videoName: 'Video 1',
      videoUrl: '',
    ),
    VideoDetails(
      category: 'Category 2',
      thumbnailUrl: 'assets/images/gym.jpg',
      type: 'Paid',
      videoDescription: 'Description 2',
      videoName: 'Video 2',
      videoUrl: '',
    ),
  ];

  LikedVideosScreen({super.key});

  void _showPaidContentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Premium Content'),
        content:
            const Text('This is premium content. Please subscribe to access.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------Background color----------------//
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.blackColor,
        title: Text(
          'Liked Videos',
          style: TextStyle(
            //-----------Text color----------------//
            color: AppColors.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView.builder(
          itemCount: likedVideos.length,
          itemBuilder: (context, index) {
            final video = likedVideos[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (video.type == 'Paid') {
                      _showPaidContentDialog(context);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoDetailsScreen(
                            videoDetails: video,
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: [
                            Container(
                              height: 150.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColors.blackColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.greyColor.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16.r),
                                image: DecorationImage(
                                  image: AssetImage(video.thumbnailUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (video.type == 'Paid')
                              Container(
                                height: 150.h,
                                width: 350.w,
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Premium Content',
                                    style: TextStyle(
                                      //-----------Text color----------------//
                                      color: AppColors.yellowColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            if (video.type == 'Paid')
                              const Positioned(
                                top: 8,
                                left: 8,
                                child: Icon(
                                  Icons.star,
                                  //-----------Icon color----------------//
                                  color: AppColors.yellowColor,
                                  size: 24,
                                ),
                              ),
                          ],
                        ),
                        Positioned(
                          bottom: 20.h,
                          left: 20.w,
                          child: Text(
                            video.videoName,
                            style: TextStyle(
                              //-----------Text color----------------//
                              color: AppColors.whiteColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.h,
                          right: 20.w,
                          child: CircularPercentIndicator(
                            radius: 25.0,
                            lineWidth: 4.0,
                            percent: 0.8,
                            center: Text(
                              "80%",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                //-----------Text color----------------//
                                color: AppColors.whiteColor,
                              ),
                            ),
                            progressColor: AppColors.redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            );
          },
        ),
      ),
    );
  }
}

class VideoDetails {
  final String category;
  final String thumbnailUrl;
  final String type;
  final String videoDescription;
  final String videoName;
  final String videoUrl;

  VideoDetails({
    required this.category,
    required this.thumbnailUrl,
    required this.type,
    required this.videoDescription,
    required this.videoName,
    required this.videoUrl,
  });
}
