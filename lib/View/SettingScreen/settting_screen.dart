import 'package:fitness/View/ProfileScreen/profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness/Constants/colors.dart'; // Assuming AppColors is defined here

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<String> trainingSettingItems = [
    "Cancel Membership",
  ];

  final List<String> helpSupportItems = [
    "Term of Services",
    "Privacy Policy",
    "App Version",
    "Delete Account",
    "Logout",
  ];

  void _onTrainingSettingTap(int index) {
    switch (index) {
      case 0:
        _showCancelMembershipDialog();
        break;
    }
  }

  void _onHelpSupportTap(int index) {
    switch (index) {
      case 0:
        print("Term of Services");
        break;
      case 1:
        print("Privacy Policy");
        break;
      case 2:
        print("App Version");
        break;
      case 3:
        _showDeleteAccountDialog();
        break;
      case 4:
        _showLogoutDialog();
        break;
    }
  }

  void _showCancelMembershipDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Membership'),
          content:
              const Text('Are you sure you want to cancel your membership?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                print("Membership cancelled.");
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                print("Account deleted.");
              },
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                print("User logged out.");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor, // Custom black color
        iconTheme: const IconThemeData(
            color: AppColors.whiteColor), // Custom white color
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(
                fontSize: 22.sp,
                color: AppColors.whiteColor), // Custom white color
          ),
        ),
      ),
      backgroundColor: AppColors.blackColor, // Custom black color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()));
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.darkgreyColor, // Custom dark grey color
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor), // Custom white color
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.whiteColor, // Custom white color
                        size: 14.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Training Settings",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor, // Custom white color
              ),
            ),
            SizedBox(height: 3.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: trainingSettingItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onTrainingSettingTap(index),
                  child: Container(
                    height: 50.h,
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.darkgreyColor, // Custom dark grey color
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            trainingSettingItems[index],
                            style: TextStyle(
                                fontSize: 14.sp,
                                color:
                                    AppColors.whiteColor), // Custom white color
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.whiteColor, // Custom white color
                            size: 14.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            Text(
              "Help & Support",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor, // Custom white color
              ),
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: ListView.builder(
                itemCount: helpSupportItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onHelpSupportTap(index),
                    child: Container(
                      height: 50.h,
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color:
                            AppColors.darkgreyColor, // Custom dark grey color
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              helpSupportItems[index],
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors
                                      .whiteColor), // Custom white color
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.whiteColor, // Custom white color
                              size: 14.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
