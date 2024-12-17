import 'package:fitness/View/Auth/Widgets/custom_text_form.dart';
import 'package:fitness/View/Auth/Widgets/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false;
  bool isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------Background Color----------------//
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Image.asset(
            'assets/images/app_logo.jpeg',
            fit: BoxFit.cover,
            height: 150.h,
            width: 150.w,
          ),
          Text(
            'Create an account',
            style: TextStyle(
              //-----------Text Color----------------//
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: WidgetsHelper.buildLabel('User Name'),
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Name',
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: WidgetsHelper.buildLabel('Email Address'),
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: WidgetsHelper.buildLabel('Password'),
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: !_isPasswordVisible,
                  suffixIcon: _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIconTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 30.h),
                WidgetsHelper.buildSignupButton(
                  isLoading: isLoading,
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });

                    //------------ Simulate a delay for sign-up process ---------------//
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                ),
                SizedBox(height: 100.h),
                WidgetsHelper.buildLoginText(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
