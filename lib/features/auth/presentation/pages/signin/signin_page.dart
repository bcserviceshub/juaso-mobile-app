import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juaso/core/utils/app_colors.dart';
import 'package:juaso/core/widgets/app_buttons.dart';
import 'package:juaso/core/widgets/text_fields.dart';
import 'package:juaso/core/widgets/text_widgets.dart';
import 'package:juaso/core/widgets/diagonal_background.dart';
import 'package:juaso/features/auth/presentation/pages/signin/forgot_password_page.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors(context: context).foreground();
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Stack(
        children: [
          // Diagonal Background
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
                          'assets/images/auth/signin/signin.png',
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
                          Header1Text(
                            text: 'Welcome back!',
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 8.h),
                          BodyText(
                            text: ' Sign in below or use your social account to get started.',
                            fontSize: 11.sp,
                            textColor: AppColors.natural900,
                          ),
                          SizedBox(height: 24.h),
                
                          // Form Fields
                          AppTextField(
                            title: 'Email or Phone number',
                            hintText: 'asdf123@gmail.com',
                            controller: _emailController,
                            inputType: TextInputType.emailAddress,
                            onChanged: (value) {
                              if (_hasError) {
                                setState(() {
                                  _hasError = false;
                                });
                              }
                            },
                          ),
                          SizedBox(height: 16.h),
                
                          AppTextField(
                            title: 'Password',
                            hintText: 'Enter your password',
                            controller: _passwordController,
                            isPassword: true,
                            onChanged: (value) {
                              if (_hasError) {
                                setState(() {
                                  _hasError = false;
                                });
                              }
                            },
                          ),
                          SizedBox(height: 16.h),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                               context.push(ForgotPasswordPage.routeName);
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

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

                          // Sign In Button
                          Center(
                            child: SizedBox(
                              width: 263.w,
                              height: 42.h,
                              child: AppButton(
                                text: 'Sign In',
                                isLoading: _isLoading,
                                onPressed: () {
                                  // Handle sign in
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),

                          // Divider with text
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: AppColors.nutural500,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Text(
                                    'or sign in with',
                                    style: TextStyle(
                                      color: AppColors.nutural500,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: AppColors.nutural500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),

                          // Social Media Login Options
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Apple
                                    InkWell(
                                      onTap: () {
                                        // Apple login logic here
                                      },
                                      child: Container(
                                        width: 50.w,
                                        height: 50.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/auth/signup/apple.png',
                                            width: 24.w,
                                            height: 24.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24.w),
                                    
                                    // Google
                                    InkWell(
                                      onTap: () {
                                        // Google login logic here
                                      },
                                      child: Container(
                                        width: 50.w,
                                        height: 50.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/auth/signup/google.png',
                                            width: 24.w,
                                            height: 24.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24.w),
                                    
                                    // Facebook
                                    InkWell(
                                      onTap: () {
                                        // Facebook login logic here
                                      },
                                      child: Container(
                                        width: 50.w,
                                        height: 50.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/auth/signup/facebook.png',
                                            width: 24.w,
                                            height: 24.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                          SizedBox(height: 24.h),
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