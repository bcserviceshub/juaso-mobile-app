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
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signup/signup_confirm_email.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  static const String routeName = '/signup';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool? validEmail;
  bool? validPassword;
  bool? validFull_name;

  String? email;
  String? full_name;
  String? password;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors(context: context).foreground();
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) => Scaffold(
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
                        MediumSized(),

                        Center(
                          child: Image.asset(
                            'assets/images/auth/signup/signup.png',
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
                              text: 'Sign up',
                              fontWeight: FontWeight.w700,
                            ),
                            MediumSized(),
                            BodyText(
                              text:
                                  'Fill your information below or register with your social account',
                              textColor:
                                  AppColors(context: context).nutural900(),
                            ),
                            LargeSized(),

                            // Form Fields
                            AppTextField(
                              title: 'Full Name',
                              hintText: 'Esi Mills',
                              controller: _nameController,
                              hasError: validFull_name == false,
                              errorText: "Full Name is required",
                              onChanged: (value) {
                                setState(() {
                                  validFull_name = value.isNotEmpty;
                                });
                              },
                            ),
                            MediumSized(),

                            AppTextField(
                              controller: _emailController,
                              hintText: "asdf123@gmail.com",
                              title: "Email",
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
                            ExtraLargeSized(),
                            Center(
                              child: SizedBox(
                                width: 263.w,
                                height: 50.h,
                                child: AppButton(
                                    text: 'Sign Up',
                                    isLoading: viewModel.isLoadingRegister,
                                    onPressed: () async {
                                      final email =
                                          _emailController.text.trim();
                                      final full_name =
                                          _nameController.text.trim();
                                      final password = _passwordController.text;
                                      if (validEmail! &&
                                          validFull_name! &&
                                          validPassword!) {
                                        await viewModel.register(
                                          email: email,
                                          full_name: full_name,
                                          password: password,
                                        );

                                        if (viewModel.errorMessage != null) {
                                          showAppDialog(
                                            context,
                                            type: AppDialogType.error,
                                            subText: viewModel.errorMessage!,
                                          );
                                        } else {
                                          context.push(
                                              SignupConfirmEmail.routeName);
                                        }
                                      }
                                    }),
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
                                      'or sign up with',
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
                                                color: Colors.black
                                                    .withOpacity(0.1),
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
                                                color: Colors.black
                                                    .withOpacity(0.1),
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
                                                color: Colors.black
                                                    .withOpacity(0.1),
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
      ),
    );
  }
}
