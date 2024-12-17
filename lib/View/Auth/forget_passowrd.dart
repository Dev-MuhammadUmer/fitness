import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/Auth/Widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  //-----------Show Snackbar----------------//
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  //-----------Submit Form----------------//
  void _submitForm() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showSnackbar('Please enter your email');
      return;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showSnackbar('Please enter a valid email address');
      return;
    }

    // Simulate action here, e.g., show a dialog or snackbar
    _showSnackbar('Email validated successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------Background Color----------------//
      backgroundColor: AppColors.blackColor,

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //-----------App Bar Color----------------//
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Image.asset(
            'assets/images/app_logo.jpeg',
            fit: BoxFit.cover,
            height: 100.h,
            width: 100.w,
          ),
          Text(
            'Recover Password',
            style: TextStyle(
              //-----------Text Color----------------//
              color: AppColors.whiteColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Email Address',
                    style: TextStyle(
                      //-----------Text Color----------------//
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      obscureText: false,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Center(
                    child: SizedBox(
                      height: 50.h,
                      width: 300.w,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          //-----------Button Colors----------------//
                          foregroundColor: AppColors.whiteColor,
                          backgroundColor: AppColors.redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            //-----------Text Color----------------//
                            color: AppColors.whiteColor,
                          ),
                        ),
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
