import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetsHelper {
  static Widget buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static Widget buildSignupButton({
    required bool isLoading,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 50.h,
      width: 300.w,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? const SpinKitFadingCircle(color: AppColors.whiteColor)
            : Text(
                "Signup",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor,
                ),
              ),
      ),
    );
  }

  static Widget buildLoginText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: Text(
            " Login",
            style: TextStyle(
              color: AppColors.redColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
