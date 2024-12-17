import 'package:fitness/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildRow(String title, String count) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          count,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {},
        ),
      ],
    ),
  );
}
