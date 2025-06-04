import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/utils/app_dialogs.dart';
import 'package:juaso_mobile_app/core/utils/string_validators.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/text_fields.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';
import 'package:juaso_mobile_app/core/widgets/diagonal_background.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/forgot_password_page.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signup/signup_page.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? validEmail;
  bool? validPassword;

  String? email;
  String? password;

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
                          MediumSized(),
                          BodyText(
                            text:
                                ' Sign in below or use your social account to get started.',
                            textColor: AppColors(context: context).nutural900(),
                          ),
                          MediumSized(),
                          // Form Fields
                          AppTextField(
                            title: 'Email or Phone number',
                            hintText: 'asdf123@gmail.com',

                            controller: _emailController,
                            hasError: validEmail == false,
                            errorText: StringValidators.validateEmail(
                                _emailController.text),
                            onChanged: (value) {
                              setState(() {
                                validEmail =
                                    StringValidators.validateBoolEmail(value);
                              });
                            },
                          ),
                          MediumSized(),

                          AppTextField(
                            title: 'Password',
                            hintText: 'Enter your password',
                            isPassword: true,
                            controller: _passwordController,
                            hasError: validPassword == false,
                            errorText: StringValidators.validatePassword(
                                _passwordController.text),
                            onChanged: (value) {
                              setState(() {
                                validPassword =
                                    _passwordController.text.length == 6;
                              });
                            },
                          ),
                          MediumSized(),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                context.push(ForgotPasswordPage.routeName);
                              },
                              child: BodyText(
                                text: 'Forgot Password?',
                                textColor: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          // Terms & Conditions Text
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors(context: context)
                                        .nutural900(),
                                  ),
                                  children: [
                                    const TextSpan(
                                        text:
                                            "By creating an account, you agree to Guaso's "),
                                    TextSpan(
                                      text: "Conditions of Use and Sale",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle Conditions of Use tap
                                        },
                                    ),
                                    const TextSpan(text: " and "),
                                    TextSpan(
                                      text: "Privacy Notice",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle Privacy Notice tap
                                        },
                                    ),
                                    const TextSpan(text: "."),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          LargeSized(),

                          // Sign In Button
                          Consumer<AuthViewModel>(
                            builder: (context, viewModel, child) => Center(
                              child: SizedBox(
                                width: 263.w,
                                height: 50.h,
                                child: AppButton(
                                  text: 'Sign In',
                                  isLoading: viewModel.isLoadingLogin,
                                  onPressed: () async {
                                    if (validEmail == true &&
                                        validPassword == true) {
                                          
                                      await viewModel.login(
                                          email: _emailController.text,
                                          password: _passwordController.text);
                                    }
                                     if (viewModel.errorMessage != null) {
                                          showAppDialog(
                                            context,
                                            type: AppDialogType.error,
                                            subText: viewModel.errorMessage!,
                                          );
                                        }else{
                                          context.push(SignupPage.routeName);
                                        }

                                  },

                                ),
                              ),
                            ),
                          ),
                          LargeSized(),

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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Text(
                                    'or sign in with',
                                    style: TextStyle(
                                      color: AppColors.nutural500,
                                      fontSize: 14.sp,
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
                          LargeSized(),

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
                                              color:
                                                  Colors.black.withOpacity(0.1),
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
                                              color:
                                                  Colors.black.withOpacity(0.1),
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
                                              color:
                                                  Colors.black.withOpacity(0.1),
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

                          ExtraLargeSized(),
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
