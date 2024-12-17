import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/Auth/Widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePassword extends StatelessWidget {
  UpdatePassword({super.key});

  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  _buildSubtitle(),
                  SizedBox(height: 30.h),
                  CustomTextField(
                    controller: _newPasswordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(height: 20.h),
                  _buildUpdateButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
              size: 24.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Create New Password',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Your new password must be different from your previously used password.',
      style: TextStyle(
        color: const Color.fromARGB(255, 148, 148, 146),
        fontSize: 10.sp,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return SizedBox(
      height: 55,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: AppColors.darkgreyColor,
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(icon, color: AppColors.whiteColor, size: 18.sp),
          filled: true,
          fillColor: AppColors.blackColor,
          contentPadding: EdgeInsets.only(left: 36.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.greyColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.greyColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.whiteColor),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        style: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp),
      ),
    );
  }

  Widget _buildUpdateButton(BuildContext context) {
    return SizedBox(
      height: 31.h,
      width: 250.w,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
        child: Text(
          "Update",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
