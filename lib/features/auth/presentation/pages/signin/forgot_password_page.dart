import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juaso/core/utils/app_colors.dart';
import 'package:juaso/core/widgets/app_buttons.dart';
import 'package:juaso/core/widgets/text_fields.dart';
import 'package:juaso/core/widgets/text_widgets.dart';
import 'package:juaso/core/widgets/diagonal_background.dart';
import 'package:juaso/features/auth/presentation/pages/signin/password_verification_email.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String routeName = '/signin/forgot-password';
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors(context: context).foreground();
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Colors.white,
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
                          'assets/images/auth/signin/forgot_password.png',
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
                          Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.natural900,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Enter your email address or phone number below to reset your password.',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.natural900,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          AppTextField(
                            title: 'Email Address or Phone Number',
                            hintText: 'Enter your email or phone number',
                            controller: _emailController,
                            inputType: TextInputType.emailAddress,
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 32.h),
                          Center(
                            child: SizedBox(
                              width: 263.w,
                              height: 42.h,
                              child: AppButton(
                                text: 'Verify email',
                                isLoading: _isLoading,
                                onPressed: (){
                                  context.push(PasswordVerficationEmail.routeName);
                                },
                              ),
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
    );
  }
} 