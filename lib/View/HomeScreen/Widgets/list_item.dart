import 'package:fitness/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildListItem(int index, List<Map<String, dynamic>> categories) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Column(
      children: [
        Container(
          height: 50.h, // Fixed height 50
          width: 50.w, // Fixed width 50
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: AssetImage(categories[index]['iconUrl']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10.h), // Spacing between image and text
        Text(
          categories[index]['title'],
          style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp),
        ),
      ],
    ),
  );
}
