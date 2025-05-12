import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso/core/utils/app_colors.dart';
import 'package:juaso/core/widgets/app_buttons.dart';
import 'package:juaso/core/widgets/diagonal_background.dart';
import 'package:juaso/core/widgets/otp_field.dart';
import 'package:juaso/core/widgets/text_widgets.dart';

class SignupConfirmPhone extends StatefulWidget {
  static const String routeName = '/signup-confirm-phone';
  const SignupConfirmPhone({super.key});

  @override
  State<SignupConfirmPhone> createState() => _SignupConfirmPhoneState();
}

class _SignupConfirmPhoneState extends State<SignupConfirmPhone> {
   TextEditingController otpController = TextEditingController();
  bool? validOtp;
  bool _isLoading = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     final textColor = AppColors(context: context).foreground();
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Stack(
        children: [
          // Diagonal Background - same as signup page
          DiagonalBackground(
            height: screenHeight * 0.45,
            color: const Color(0xFFE0F7F7),
          ),
          
          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Fixed content (non-scrollable)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      // Back Button
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: textColor,
                          size: 20.sp,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      SizedBox(height: 16.h),

                      Center(
                        child: Image.asset(
                          'assets/images/auth/signup/signup.png',
                          width: 160.w,
                          height: 160.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),

                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Center(
                            child: Header1Text(
                              text: 'Verify phone number',
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          
                          // Subtitle
                          Center(
                            child: BodyText(
                              text: 'To verify your phone number, we have sent a One Time Password (OTP) to 01037098',
                              fontSize: 11.sp,
                              textColor: AppColors.natural900,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        
                          SizedBox(height: 32.h),
  
                          // OTP Input Field
                          OtpField(
                            controller: otpController,
                            length: 4,
                            hasError: validOtp == false,
                            title: "Enter OTP",
                            onCompleted: (v) {
                              setState(() {
                                validOtp = true;
                              });
                            },
                            onChanged: (value) {
                              if (otpController.text != value) {
                                otpController.text = value;
                              }
                              setState(() {
                                validOtp = value.length == 4;
                              });
                            },
                          ),
                          
                          SizedBox(height: 32.h),
                          
                          // Create Account Button
                          Center(
                            child: SizedBox(
                              width: 263.w,
                              height: 42.h,
                              child: AppButton(
                                text: 'Create your Juaso account',
                                isLoading: _isLoading,
                                onPressed: () {
                                  // Verify OTP and create account
                                },
                              ),
                            ),
                          ),
                          
                          SizedBox(height: 16.h),
                          
                          // Terms & Conditions Text
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                BodyText(
                                  text: "By creating an account, you agree to Guaso's ",
                                  fontSize: 11.sp,
                                  textColor: AppColors.natural900,
                                ),
                                LinkText(
                                  text: "Conditions of Use",
                                  fontSize: 11.sp,
                                  textColor: AppColors.primary,
                                  onTap: () {
                                    // Handle Conditions of Use tap
                                  },
                                ),
                                BodyText(
                                  text: " and ",
                                  fontSize: 11.sp,
                                  textColor: AppColors.natural900,
                                ),
                                LinkText(
                                  text: "Privacy Notice",
                                  fontSize: 11.sp,
                                  textColor: AppColors.primary,
                                  onTap: () {
                                    // Handle Privacy Notice tap
                                  },
                                ),
                                BodyText(
                                  text: ".",
                                  fontSize: 11.sp,
                                  textColor: AppColors.natural900,
                                ),
                              ],
                            ),
                          ),
                          
                          SizedBox(height: 24.h),
                          
                          // Resend Code
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                // Resend OTP logic
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(10.w, 10.h),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Resend code',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(height: 16.h),
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
    );
  }
}
