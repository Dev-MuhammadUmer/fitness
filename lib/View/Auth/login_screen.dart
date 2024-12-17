import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/Auth/Widgets/custom_text_form.dart';
import 'package:fitness/View/BottomNavBar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fitness/View/Auth/forget_passowrd.dart';
import 'package:fitness/View/Auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //-----------Snackbar----------------//
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  //-----------Submit Form----------------//
  void _submitForm() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Basic validation
    if (email.isEmpty || password.isEmpty) {
      _showSnackbar('Please fill in all fields');
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showSnackbar('Please enter a valid email address');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    //------------ Simulate a delay (login attempt) ----------------//
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      //-------------- On successful login, navigate to home screen -------------//
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------Background Color----------------//
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Image.asset(
              'assets/images/app_logo.jpeg',
              fit: BoxFit.cover,
              height: 150.h,
              width: 150.w,
            ),
            Text(
              'Login to your account',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: 50.h,
                    child: CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      obscureText: false,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Password',
                    style: TextStyle(
                      //-----------Text Color----------------//
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    child: CustomTextField(
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                          //-----------Text Color----------------//
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: SizedBox(
                      height: 50.h,
                      width: 300.w,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          //-----------Button Colors----------------//
                          foregroundColor: AppColors.whiteColor,
                          backgroundColor: AppColors.redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: _isLoading
                            ? const SpinKitFadingCircle(
                                color: AppColors.whiteColor,
                              )
                            : Text(
                                "Login",
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
                  SizedBox(height: 100.h),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16.sp,
                            //-----------Text Color----------------//
                            color: AppColors.whiteColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Signup',
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
