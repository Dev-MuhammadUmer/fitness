import 'package:fitness/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDetailRow(String title, String value) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 13.sp, color: AppColors.whiteColor)),
          Text(value,
              style: TextStyle(fontSize: 13.sp, color: AppColors.whiteColor)),
        ],
      ),
      const Divider(color: Color.fromARGB(255, 233, 231, 231)),
    ],
  );
}
