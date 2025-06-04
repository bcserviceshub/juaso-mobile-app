import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/diagonal_background.dart';
import 'package:juaso_mobile_app/core/widgets/text_fields.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

class EnterNewPassword extends StatefulWidget {
  static String routeName = '/enter-new-password';
  const EnterNewPassword({super.key});

  @override
  State<EnterNewPassword> createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';
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
                      MediumSized(),
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
                      LargeSized(),

                      Center(
                        child: Image.asset(
                          'assets/images/auth/signin/password-reset.png',
                          width: 160.w,
                          height: 160.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      MediumSized(),
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
                            text: 'Enter new password',
                            fontWeight: FontWeight.w700,
                          ),
                          MediumSized(),
                          BodyText(
                            text:
                                ' This password will be required each time you sign in',
                            textColor: AppColors(context: context).nutural900(),
                          ),
                          MediumSized(),
                          AppTextField(
                            title: 'Enter new password',
                            hintText: 'Enter your password',
                            controller: _passwordController,
                            onChanged: (value) {
                              if (_hasError) {
                                setState(() {
                                  _hasError = false;
                                });
                              }
                            },
                          ),
                          
                          LargeSized(),

                          AppTextField(
                            title: 'Re-enter new password',
                            hintText: 're-enter your password',
                            controller: _passwordController,
                            onChanged: (value) {
                              if (_hasError) {
                                setState(() {
                                  _hasError = false;
                                });
                              }
                            },
                          ),
                          LargeSized(),
                          // Sign In Button
                          Center(
                            child: SizedBox(
                              width: 263.w,
                              height: 42.h,
                              child: AppButton(
                                text: 'Save changes',
                                isLoading: _isLoading,
                                onPressed: () {
                                  // Handle sign in
                                },
                              ),
                            ),
                          ),
                          ExtraLargeSized(),

                          // Divider with text
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
