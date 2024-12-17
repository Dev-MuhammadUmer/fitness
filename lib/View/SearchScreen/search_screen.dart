import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness/Constants/colors.dart'; // Add this import

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _videos = [
    {
      "videoName": "Video 1",
      "category": "Category A",
      "type": "free",
      "thumbnailUrl": "assets/images/gym1.jpg"
    },
    {
      "videoName": "Video 2",
      "category": "Category B",
      "type": "paid",
      "thumbnailUrl": "assets/images/cardio.jpg"
    },
    {
      "videoName": "Video 3",
      "category": "Category A",
      "type": "free",
      "thumbnailUrl": "assets/images/gam.jpeg"
    },
    {
      "videoName": "Video 4",
      "category": "Category C",
      "type": "paid",
      "thumbnailUrl": "assets/images/card.jpg"
    },
  ];
  List<Map<String, dynamic>> _filteredVideos = [];

  @override
  void initState() {
    super.initState();
    _filteredVideos = _videos;
  }

  void _filterVideos(String query) {
    setState(() {
      _filteredVideos = _videos.where((video) {
        final videoNameLower = video['videoName'].toLowerCase();
        final categoryLower = video['category'].toLowerCase();
        final searchLower = query.toLowerCase();

        return videoNameLower.contains(searchLower) ||
            categoryLower.contains(searchLower);
      }).toList();
    });
  }

  bool _isPaidVideo(Map<String, dynamic> video) {
    return video['type'].toLowerCase() == 'paid';
  }

  void _showPaidContentDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Paid Content"),
          content: const Text(
              "This is paid content. Please subscribe to access it."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor, // Use AppColors.blackColor
      body: Column(
        children: [
          SizedBox(height: 20.h), // Add space above AppBar
          PreferredSize(
            preferredSize: const Size.fromHeight(200.0),
            child: AppBar(
              backgroundColor: AppColors.blackColor, // Use AppColors.blackColor
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Program',
                        style: TextStyle(
                          color:
                              AppColors.whiteColor, // Use AppColors.whiteColor
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(
                          width: 270.w,
                          child: TextField(
                            controller: _searchController,
                            onChanged: _filterVideos,
                            style: const TextStyle(
                              color: AppColors
                                  .whiteColor, // Use AppColors.whiteColor
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors
                                  .darkgreyColor, // Use AppColors.darkGreyColor
                              hintText: 'Search Program',
                              hintStyle: TextStyle(
                                color: AppColors
                                    .greyColor, // Use AppColors.greyColor
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: AppColors
                                    .whiteColor, // Use AppColors.whiteColor
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                  color: AppColors
                                      .greyColor, // Use AppColors.greyColor
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                  color: AppColors
                                      .greyColor, // Use AppColors.greyColor
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                  color: AppColors
                                      .greyColor, // Use AppColors.greyColor
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: AppColors
                                .whiteColor, // Use AppColors.whiteColor
                            size: 24.sp,
                          ),
                          onPressed: () {
                            // Add your filter action here
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Programs (${_filteredVideos.length})',
                      style: TextStyle(
                        color: AppColors.whiteColor, // Use AppColors.whiteColor
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 350.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: _filteredVideos.isEmpty
                          ? Center(
                              child: Text(
                                'No videos found',
                                style: TextStyle(
                                  color: AppColors
                                      .whiteColor, // Use AppColors.whiteColor
                                  fontSize: 16.sp,
                                ),
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: _filteredVideos.length,
                              itemBuilder: (context, index) {
                                final video = _filteredVideos[index];

                                return GestureDetector(
                                  onTap: () {
                                    if (_isPaidVideo(video)) {
                                      _showPaidContentDialog();
                                    } else {
                                      // Navigate to video playback screen
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 60.h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: AppColors
                                                  .darkgreyColor, // Use AppColors.darkGreyColor
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.w),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        height: 40.h,
                                                        width: 60.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .blackColor, // Use AppColors.blackColor
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(video[
                                                                'thumbnailUrl']),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 10.h,
                                                        left: 20.w,
                                                        child: Icon(
                                                          Icons.play_arrow,
                                                          color: AppColors
                                                              .whiteColor, // Use AppColors.whiteColor
                                                          size: 25.r,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        video['videoName'],
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .whiteColor, // Use AppColors.whiteColor
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      Text(
                                                        video['category'],
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .whiteColor, // Use AppColors.whiteColor
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (_isPaidVideo(video))
                                            Positioned.fill(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.blackColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 50.w, right: 20.w),
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Icon(
                                                        Icons.lock,
                                                        color: AppColors
                                                            .yellowColor,
                                                        size: 30.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
