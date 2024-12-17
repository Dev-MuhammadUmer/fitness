import 'dart:io';
import 'package:fitness/Constants/colors.dart'; // Assuming AppColors is imported from here
import 'package:fitness/View/ProfileScreen/Widgets/detailed_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? name = "John Doe";
  String? email = "johndoe@example.com";
  String? imageUrl; // This will hold the path of the selected image
  File? _image;
  bool _isImageSelected = false;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isImageSelected = true;
      });
    }
  }

  void _clearImage() {
    setState(() {
      _image = null;
      _isImageSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor, // Custom black color
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: AppColors.whiteColor), // Custom white color
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.blackColor, // Custom black color
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit,
                color: AppColors.whiteColor, // Custom white color
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.darkgreyColor, // Custom dark grey color
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyColor
                              .withOpacity(0.5), // Custom grey color
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        Text(
                          name ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors
                                .darkgreyColor, // Custom dark grey color
                          ),
                        ),
                        Text(
                          email ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors
                                .darkgreyColor, // Custom dark grey color
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          color: AppColors.greyColor, // Custom grey color
                          height: 20.h,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "User Information",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color:
                                    AppColors.blackColor, // Custom black color
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Divider(
                              color:
                                  AppColors.whiteColor), // Custom white color
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              buildDetailRow("Name:", name ?? "N/A"),
                              SizedBox(height: 15.h),
                              buildDetailRow("Email:", email ?? "N/A"),
                              SizedBox(height: 15.h),
                              buildDetailRow(
                                  "Account Created Date:", "01-01-2021"),
                              SizedBox(height: 15.h),
                              buildDetailRow("Subscription:", "Active"),
                              SizedBox(height: 5.h),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -30.h,
                    left: 0.w,
                    right: 0.w,
                    child: Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                AppColors.redColor, // Custom red color
                            radius: 60.r,
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.blackColor, // Custom black color
                              radius: 58.r,
                              backgroundImage: _isImageSelected
                                  ? FileImage(_image!) // Use selected image
                                  : const AssetImage(
                                      'assets/images/lowerbody.jpg',
                                    ) as ImageProvider<
                                      Object>, // Default asset image
                            ),
                          ),
                          Positioned(
                            bottom: 0.h,
                            left: 80.w,
                            child: GestureDetector(
                              onTap: () async {
                                await _pickImage(ImageSource.gallery);
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    AppColors.blackColor, // Custom black color
                                radius: 15.r,
                                backgroundImage:
                                    const AssetImage('assets/images/came.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_isImageSelected) ...[
                    Positioned(
                      top: 100.h,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check,
                                color:
                                    AppColors.greenColor), // Custom green color
                            onPressed: () {
                              setState(() {
                                imageUrl =
                                    _image?.path; // Save selected image path
                                _clearImage();
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close,
                                color: AppColors.redColor), // Custom red color
                            onPressed: _clearImage,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
