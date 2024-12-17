import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/DetailsScreen/video_screen.dart';
import 'package:fitness/View/HomeScreen/Widgets/categories_videos.dart';
import 'package:fitness/View/HomeScreen/Widgets/list_item.dart';
import 'package:fitness/View/HomeScreen/Widgets/pop_up.dart';
import 'package:fitness/View/SubscriptionScreen/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //----------------- Variable for user name --------------------//
  String? name = "Umar Arshad";

  //----------------- List of categories --------------------//
  List<Map<String, dynamic>> categories = [
    {"title": "Cardio", "iconUrl": "assets/images/cardio.jpg"},
    {"title": "Bench", "iconUrl": "assets/images/bench.jpg"},
    {"title": "Leg", "iconUrl": "assets/images/leg.jpg"},
    {"title": "Body", "iconUrl": "assets/images/lowerbody.jpg"},
    {"title": "Shaker", "iconUrl": "assets/images/shaker.jpg"},
  ];

  //----------------- List of fitness videos --------------------//
  List<VideoDetails> fitnessVideos = [
    VideoDetails(
      videoUrl:
          'https://videos.pexels.com/video-files/4745810/4745810-uhd_2560_1440_25fps.mp4',
      thumbnailUrl: 'assets/images/gym1.jpg',
      videoName: 'Workout Basics',
      videoDescription: 'A basic workout routine to start with.',
      duration: const Duration(minutes: 5),
    ),
    VideoDetails(
      videoUrl:
          'https://videos.pexels.com/video-files/4745810/4745810-uhd_2560_1440_25fps.mp4',
      thumbnailUrl: 'assets/images/lowerbody.jpg',
      videoName: 'Advanced Training',
      videoDescription: 'Advanced leg and lower body workout.',
      duration: const Duration(minutes: 10),
    ),
  ];

  //----------------- List of yoga videos --------------------//
  List<VideoDetails> yogaVideos = [
    VideoDetails(
      videoUrl:
          'https://videos.pexels.com/video-files/4745810/4745810-uhd_2560_1440_25fps.mp4',
      thumbnailUrl: 'assets/images/up.jpg',
      videoName: 'Beginner Yoga',
      videoDescription: 'A gentle introduction to yoga.',
      duration: const Duration(minutes: 15),
    ),
  ];

  //----------------- List of meditation videos --------------------//
  List<VideoDetails> meditationVideos = [
    VideoDetails(
      videoUrl:
          'https://videos.pexels.com/video-files/4745810/4745810-uhd_2560_1440_25fps.mp4',
      thumbnailUrl: 'assets/images/card.jpg',
      videoName: 'Mindfulness',
      videoDescription: 'Focus on your breathing with this meditation.',
      duration: const Duration(minutes: 20),
    ),
    VideoDetails(
      videoUrl:
          'https://videos.pexels.com/video-files/4745810/4745810-uhd_2560_1440_25fps.mp4',
      thumbnailUrl: 'assets/images/corebody.jpg',
      videoName: 'Deep Relaxation',
      videoDescription: 'A deep relaxation meditation session.',
      duration: const Duration(minutes: 25),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //----------------- Build the main screen --------------------//
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10, top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----------------- Add space above --------------------//
              SizedBox(height: 15.h),

              //----------------- Greeting and icons --------------------//
              Row(
                children: [
                  Text(
                    'Hi, Good Day',
                    style:
                        TextStyle(color: AppColors.greyColor, fontSize: 14.sp),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.message,
                        color: AppColors.whiteColor, size: 18),
                    onPressed: () => PopupHelper.showMessagePopup(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications,
                        color: AppColors.whiteColor, size: 18),
                    onPressed: () => PopupHelper.showNotificationPopup(context),
                  ),
                ],
              ),

              //----------------- Display user name --------------------//
              Text(
                name ?? 'User',
                style: TextStyle(color: AppColors.whiteColor, fontSize: 18.sp),
              ),

              //----------------- Add space below --------------------//
              SizedBox(height: 10.h),

              //----------------- Subscription banner --------------------//
              Stack(
                children: <Widget>[
                  Container(
                    height: 150.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      color: AppColors.darkgreyColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Column(
                        children: [
                          Text(
                            'Connect to fitness app to unlock',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SubscriptionPlan()));
                            },
                            child: Container(
                              height: 40.h,
                              width: 280.w,
                              decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.lock,
                                      color: AppColors.blackColor),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'Unlock the Subscriptions',
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //----------------- Add space below --------------------//
              SizedBox(height: 10.h),

              //----------------- Program categories header --------------------//
              Text(
                "Program Categories",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500),
              ),

              //----------------- Add space below --------------------//
              SizedBox(height: 10.h),

              //----------------- Display categories list --------------------//
              SizedBox(
                height: 80.h,
                width: 350.w,
                child: categories.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              List<VideoDetails> selectedVideos;

                              // Set the correct list based on the selected category
                              switch (categories[index]['title']) {
                                case 'Cardio':
                                  selectedVideos = fitnessVideos;
                                  break;
                                case 'Bench':
                                  selectedVideos =
                                      fitnessVideos; // Customize this list
                                  break;
                                case 'Leg':
                                  selectedVideos = fitnessVideos;
                                  break;
                                case 'Body':
                                  selectedVideos = fitnessVideos;
                                  break;
                                case 'Shaker':
                                  selectedVideos = fitnessVideos;
                                  break;
                                default:
                                  selectedVideos = [];
                              }

                              // Navigate to HighlightScreen with the selected videos
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoScreen(
                                    selectedVideo:
                                        selectedVideos[0], // The first video
                                    matchedVideos:
                                        selectedVideos, // All videos in the category
                                  ),
                                ),
                              );
                            },
                            child: buildListItem(index, categories),
                          );
                        },
                      )
                    : const Center(
                        child: SpinKitFadingCircle(
                        color: AppColors.whiteColor,
                      )),
              ),

              //----------------- Add space before videos --------------------//
              SizedBox(height: 30.h),

              //----------------- Display categorized videos --------------------//
              Column(
                children: [
                  buildCategoryVideos('Fitness', fitnessVideos),
                  buildCategoryVideos('Yoga', yogaVideos),
                  buildCategoryVideos('Meditation', meditationVideos),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//----------------- VideoDetails class for video metadata --------------------//
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
