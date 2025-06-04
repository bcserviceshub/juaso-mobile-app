import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/utils/app_dialogs.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';
import 'package:juaso_mobile_app/core/widgets/diagonal_background.dart';
import 'package:juaso_mobile_app/core/widgets/otp_field.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/signin_page.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupConfirmEmail extends StatefulWidget {
  static String routeName = '/signup_confirm-email';

  const SignupConfirmEmail({
    super.key, // Default email
  });

  @override
  State<SignupConfirmEmail> createState() => _SignupConfirmEmailState();
}

class _SignupConfirmEmailState extends State<SignupConfirmEmail> {
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

    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) => Scaffold(
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
                        MediumSized(),

                        Center(
                          child: Image.asset(
                            'assets/images/auth/signup/verifyuser.png',
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
                              text: 'Verify email address',
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                            MediumSized(),

                            // Subtitle
                            Center(
                              child: BodyText(
                                text:
                                    'To verify your email, we have sent a One Time Password (OTP) to asdf123@gmail.com',
                                textColor:
                                    AppColors(context: context).nutural900(),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            LargeSized(),

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

                            LargeSized(),

                            // Create Account Button
                            Center(
                              child: SizedBox(
                                width: 263.w,
                                height: 50.h,
                                child: AppButton(
                                  text: 'Create your Juaso account',
                                  isLoading: viewModel.isLoadingVerify,
                                  onPressed: () async {
                                    if (validOtp!) {
                                      await viewModel.verify(
                                        email: viewModel.email!,
                                        otp: int.parse(otpController.text),
                                        full_name: viewModel.full_name!,
                                        password: viewModel.password!,
                                      );
                                      if (viewModel.errorMessage != null) {
                                        showAppDialog(
                                          context,
                                          type: AppDialogType.error,
                                          subText: viewModel.errorMessage!,
                                        );
                                      }else{
                                        context.push(SigninPage.routeName);

                                      }
                                      
                                    }

                                    // Verify OTP and create account
                                  },
                                ),
                              ),
                            ),

                            LargeSized(),

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

                            // Resend Code
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () async {
                                 // *** Read from ViewModel directly ***
                                  await viewModel.register(
                                    email: viewModel.email!,
                                    full_name: viewModel.full_name!,
                                    password: viewModel.password!,
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(10.w, 10.h),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
      ),
    );
  }
}
