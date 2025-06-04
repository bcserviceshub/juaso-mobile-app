import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bb/signup/widgets/basic_info_form.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bb/signup/widgets/business_registration_complete.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bb/signup/widgets/vendor_verification_form.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bb/signup/widgets/sales_online_presence_form.dart';

class BusinessSignup extends StatefulWidget {
  static  String routeName  = "/business-signup";
  const BusinessSignup({super.key});

  @override
  State<BusinessSignup> createState() => _BusinessSignupState();
}

class _BusinessSignupState extends State<BusinessSignup> {
  int _currentStep = 0;
  late final PageController _pageController;
  bool _isLoading = false;

  final List<String> _stepTitles = [
    'Basic Info',
    'Vendor Verification',
    'Sales & Online Presence',
  ];

  final List<Widget> _stepForms = const [
    BasicInfoForm(),
    VendorVerificationForm(),
    SalesOnlinePresenceForm(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentStep);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastStep = _currentStep == _stepForms.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: BodyText(
                      text: "Cancel",
                      textColor: AppColors(context: context).nutural600(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Header1Text(text: "Register your Business with Juaso today!"),
              SizedBox(height: 24.h),
              _buildStepIndicator(),
              SizedBox(height: 16.h),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _stepForms.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentStep = index;
                    });
                  },
                  itemBuilder: (context, index) => _stepForms[index],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: isLastStep
                    ? Center(
                        child: SizedBox(
                          width:263,
                          height: 45.h,
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : AppButton(
                                  text: "Complete Registration",
                                  onPressed: () async {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    // Simulate authentication delay
                                    await Future.delayed(const Duration(seconds: 2));
                                    // Submit logic here
                                    if (mounted) {
                                      context.goNamed(BusinessRegistrationComplete.routeName);
                                    }
                                  },
                                ),
                        ),
                      )
                    : Row(
                        children: [
                          if (_currentStep > 0)
                            SizedBox(
                              width: 132.w,
                              height: 42.h,
                              child: AppButtonAlt(
                                text: "Previous",
                                onPressed: () {
                                  if (_pageController.hasClients) {
                                    _pageController.previousPage(
                                      duration: const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                              ),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: 132.w,
                            height: 42.h,
                            child: _isLoading
                                ? const Center(
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : AppButton(
                                    text: "Save & Continue",
                                    onPressed: () async {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      try {
                                        // Add your authentication logic here
                                        await Future.delayed(const Duration(seconds: 2)); // Replace with actual auth
                                        if (mounted) {
                                          if (_pageController.hasClients) {
                                            _pageController.nextPage(
                                              duration: const Duration(milliseconds: 400),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        }
                                      } finally {
                                        if (mounted) {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        }
                                      }
                                    },
                                  ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: completed + current step + label
            Row(
              children: [
                ...List.generate(_currentStep + 1, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: CircleAvatar(
                      radius: 8.r,
                      backgroundColor: AppColors.primary,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(width: 8.w),
                BodyText(
                  text: _stepTitles[_currentStep],
                   textColor: AppColors(context: context).nutural900(),
                   ),
              ],
            ),
            // Right side: remaining steps tightly grouped
            Row(
              children: List.generate(_stepTitles.length - _currentStep - 1, (i) {
                int number = _currentStep + i + 2;
                return Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: CircleAvatar(
                    radius: 8.r,
                    backgroundColor: const Color(0xFFE5FAEB),
                    child: Text(
                      '$number',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        LinearProgressIndicator(
          value: (_currentStep + 1) / _stepTitles.length,
          backgroundColor: const Color(0xFFE9E9E9),
          color: AppColors.primary,
          minHeight: 6.0,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }
}
