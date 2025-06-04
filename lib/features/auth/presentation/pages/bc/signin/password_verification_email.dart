import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/otp_field.dart';
import 'package:juaso_mobile_app/core/widgets/text_fields.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';
import 'package:juaso_mobile_app/core/widgets/diagonal_background.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/enter_new_password.dart';

class PasswordVerficationEmail extends StatefulWidget {
  static const String routeName = '/signin/password-verification';
  const PasswordVerficationEmail({super.key});

  @override
  State<PasswordVerficationEmail> createState() => _PasswordVerficationEmailState();
}

class _PasswordVerficationEmailState extends State<PasswordVerficationEmail> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  bool ? validOtp;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors(context: context).foreground();
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Stack(
        children: [
          DiagonalBackground(
            height: screenHeight * 0.45,
            color: const Color(0xFFE0F7F7),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
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
                          'assets/images/auth/signin/password_verification.png',
                          width: 160.w,
                          height: 160.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Header1Text(
                            text: 'Password Verification',
                            fontWeight: FontWeight.w700,
                            textColor: AppColors(context: context).nutural900(),
                          ),
                          MediumSized(),
                         
                         BodyText(
                            text:
                                'Enter the verification code we just sent to your email address.',
                            textColor: AppColors(context: context)
                                .nutural900(),
                          ),
                          ExtraLargeSized(),
                         
                         OtpField(
                            controller: _otpController,
                            length: 4,
                            hasError: validOtp == false,
                            onCompleted: (v) {
                              setState(() {
                                validOtp = true;
                              });
                            },
                            onChanged: (value) {
                              if (_otpController.text != value) {
                                _otpController.text = value;
                              }
                              setState(() {
                                validOtp = value.length == 4;
                              });
                            },
                          ),
                          LargeSized(),
                          Center(
                            child: SizedBox(
                              width: 263.w,
                              height: 42.h,
                              child: AppButton(
                                text: 'Verify Code',
                                isLoading: _isLoading,
                                onPressed: () {
                                  context.push(EnterNewPassword.routeName);
                                },
                              ),
                            ),
                          ),
                          LargeSized(),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12.r,
                                backgroundColor: const Color(0xFFFFF4ED),
                                child: Image.asset(
                                  'assets/images/auth/signin/warning.png',
                                  width: 16.w,
                                  height: 16.h,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  'Didn\'t receive code? Resend in 00:59',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors(context: context).nutural900(),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
