import 'package:fitness/View/Payment/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:fitness/Constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  int? _selectedSubscriptionIndex;

  final List<Map<String, String>> _subscriptions = [
    {
      'title': 'Basic Plan',
      'price': '10',
      'description': 'Access basic features with limited options.',
      'timePeriod': '1 Month',
    },
    {
      'title': 'Standard Plan',
      'price': '20',
      'description': 'Unlock most features and content.',
      'timePeriod': '3 Months',
    },
    {
      'title': 'Premium Plan',
      'price': '50',
      'description': 'Get full access to all features and content.',
      'timePeriod': '1 Year',
    },
  ];

  void _onBuyNowPressed() {
    if (_selectedSubscriptionIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a subscription first.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PayFee()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: AppColors.whiteColor, size: 24.sp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10.w),
                Text(
                  "Subscription Plans",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                ' Monthly :',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 480.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _subscriptions.length,
              itemBuilder: (context, index) {
                final subscription = _subscriptions[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSubscriptionIndex = index;
                    });
                  },
                  child: _buildSubscriptionCard(
                    subscription,
                    index == _selectedSubscriptionIndex,
                    index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(
      Map<String, String> subscription, bool isSelected, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      padding: EdgeInsets.all(15.h),
      height: 450.h,
      width: 350.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isSelected
              ? [AppColors.primaryColor, AppColors.primaryColorAccent]
              : [AppColors.secondaryColor, AppColors.accentColor],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20.h),
          Text(
            subscription['title']!,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            '\$${subscription['price']} / month',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            subscription['description']!,
            style: TextStyle(
              color: AppColors.whiteColor.withOpacity(0.85),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            'Time Period : ${subscription['timePeriod']}',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16.sp,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 50.h,
            width: 180.w,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedSubscriptionIndex = index;
                });
                _onBuyNowPressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
