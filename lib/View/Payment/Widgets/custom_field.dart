import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness/Constants/colors.dart';

Widget buildTextField({
  required String title,
  required String hint,
  required TextEditingController controller,
  bool isNumber = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: title,
        hintText: hint,
        filled: true,
        fillColor: AppColors.whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),
  );
}
