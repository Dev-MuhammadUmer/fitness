import 'package:fitness/Constants/colors.dart';
import 'package:fitness/View/Auth/Widgets/custom_text_form.dart';
import 'package:fitness/View/BottomNavBar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayFee extends StatefulWidget {
  const PayFee({super.key});

  @override
  State<PayFee> createState() => _PayFeeState();
}

class _PayFeeState extends State<PayFee> {
  // TextEditingController instances to handle user input.
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  // Form key to validate and manage form state.
  final formkey = GlobalKey<FormState>();

  // List of supported currencies.
  final List<String> currencyList = ['USD', 'PKR', 'EUR', 'JPY', 'GBP', 'AED'];

  // Default selected currency.
  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color for the screen.
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        // Allow vertical scrolling for the content.
        child: Padding(
          // Add padding around the content.
          padding: const EdgeInsets.all(8.0),
          child: Form(
            // Form widget to wrap input fields.
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer for better layout.
                SizedBox(height: 20.h),
                // Container for logo or header image.
                Stack(
                  children: [
                    Container(
                      height: 150.h,
                      width: double.infinity,
                      color: AppColors.blackColor,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Image.asset('assets/images/app_name.jpeg'),
                      ),
                    ),
                    Positioned(
                      top: 40.h,
                      left: 10.w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),

                // Spacer for better layout.
                SizedBox(height: 20.h),
                // Title text for the form.
                Text(
                  "Fill the form to get Subscription",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Spacer for better layout.
                SizedBox(height: 20.h),
                // Row for subscription amount and currency selection.
                Row(
                  children: [
                    // Expanded widget for amount input field.
                    Expanded(
                      flex: 5,
                      child: CustomTextField(
                        controller: amountController,
                        hintText: 'Any amount you like',
                        prefixIcon: Icons.attach_money,
                        obscureText: false,
                      ),
                    ),
                    // Spacer for spacing between fields.
                    SizedBox(width: 10.w),
                    // Dropdown for currency selection.
                    DropdownButton<String>(
                      dropdownColor:
                          AppColors.whiteColor, // Dropdown background color
                      focusColor: AppColors.whiteColor,
                      value: selectedCurrency,
                      style: TextStyle(
                        color: AppColors
                            .whiteColor, // Text color for the selected value
                        fontSize: 16.sp,
                      ),
                      items: currencyList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: AppColors
                                  .whiteColor, // Text color for dropdown items
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCurrency = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                // Spacer for better layout.
                SizedBox(height: 10.h),
                // Text field for name input.
                CustomTextField(
                  controller: nameController,
                  hintText: "Ex. Umar Arshad",
                  prefixIcon: Icons.person,
                  obscureText: false,
                ),
                SizedBox(height: 10.h),
                // Text field for address input.
                CustomTextField(
                  controller: addressController,
                  hintText: "Ex. 123 Main St",
                  prefixIcon: Icons.location_on,
                  obscureText: false,
                ),
                SizedBox(height: 10.h),
                // Row for city and state input.
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomTextField(
                        controller: cityController,
                        hintText: "Ex. Lahore",
                        prefixIcon: Icons.location_city,
                        obscureText: false,
                      ),
                    ),
                    // Spacer for spacing between fields.
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 5,
                      child: CustomTextField(
                        controller: stateController,
                        hintText: "Ex. LHR for Lahore",
                        prefixIcon: Icons.map,
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                // Spacer for better layout.
                SizedBox(height: 10.h),
                // Row for country and pincode input.
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomTextField(
                        controller: countryController,
                        hintText: "Ex. PK for Pakistan",
                        prefixIcon: Icons.flag,
                        obscureText: false,
                      ),
                    ),
                    // Spacer for spacing between fields.
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 5,
                      child: CustomTextField(
                        controller: pincodeController,
                        hintText: "Ex. 123456",
                        prefixIcon: Icons.pin_drop,
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                // Spacer for better layout.
                SizedBox(height: 50.h),
                // Button to proceed to payment.
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.r), // Add border radius here
                      ),
                      backgroundColor: AppColors.redColor,
                    ),
                    child: const Text(
                      "Proceed to Pay",
                      style:
                          TextStyle(color: AppColors.whiteColor, fontSize: 16),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        // Show confirmation dialog on successful validation.
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Payment'),
                            content:
                                const Text('Proceeding to payment screen...'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close current dialog
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Confirmation'),
                                      content:
                                          const Text('Payment successful!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close this dialog
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const BottomNavScreen(),
                                              ),
                                            );
                                          },
                                          child: const Text('Okay'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
