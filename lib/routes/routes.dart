import 'package:fitness/View/Auth/login_screen.dart';
import 'package:fitness/View/Auth/signup_screen.dart';
import 'package:fitness/View/BottomNavBar/bottom_nav_bar.dart';
import 'package:fitness/View/HomeScreen/home_screen.dart';
import 'package:fitness/View/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //--------------------------------------------------------------------------
      case RoutesName.splashscreen:
        return PageRouteBuilder(
          settings:
              settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
          pageBuilder: (_, __, ___) => const SplashScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
      case RoutesName.homeScreen:
        return PageRouteBuilder(
          settings:
              settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
      case RoutesName.bottomnavscreen:
        return PageRouteBuilder(
          settings:
              settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
          pageBuilder: (_, __, ___) => const BottomNavScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
      case RoutesName.loginscreen:
        return PageRouteBuilder(
          settings:
              settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
      case RoutesName.signupscreen:
        return PageRouteBuilder(
          settings:
              settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
          pageBuilder: (_, __, ___) => const SignupScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
//--------------------------------------------------------------------------
      // Default Screen
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        }); // MaterialPageRoute
    }
  }
}
