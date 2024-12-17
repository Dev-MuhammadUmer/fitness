import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/HomeScreen/home_screen.dart';
import 'package:fitness/View/LikeVideoScreen/like_video_screen.dart';
import 'package:fitness/View/ProfileScreen/profile_screen.dart';
import 'package:fitness/View/SearchScreen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    LikedVideosScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  //-----------On Item Tapped----------------//
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------Background Color----------------//
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 14.0.h, left: 15.w, right: 15.w),
        child: Container(
          decoration: BoxDecoration(
            //-----------Background Color----------------//
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: BottomNavigationBar(
              //-----------Background Color----------------//
              backgroundColor: AppColors.darkgreyColor,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: AppColors.darkgreyColor,
                  icon: Icon(Icons.home, size: 25),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.darkgreyColor,
                  icon: Icon(Icons.favorite, size: 25),
                  label: 'Fav',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.darkgreyColor,
                  icon: Icon(Icons.search, size: 25),
                  label: 'Seacrh',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.darkgreyColor,
                  icon: Icon(Icons.person, size: 25),
                  label: 'profile',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              //-----------Selected Item Color----------------//
              selectedItemColor: AppColors.redColor,
              //-----------Unselected Item Color----------------//
              unselectedItemColor: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
