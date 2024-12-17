import 'dart:async';
import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/Auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), _navigateToNextScreen);
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Image.asset(
            'assets/images/app_name.jpeg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
