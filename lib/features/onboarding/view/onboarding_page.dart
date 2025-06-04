import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/signin_page.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signup/signup_page.dart';
import 'package:juaso_mobile_app/features/onboarding/utils/onboarding_utils.dart';



class OnboardingPage extends StatefulWidget {
  static const String routeName = '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late Timer _timer;

  switchImage(){
    _timer = Timer.periodic(const Duration(seconds: 3), (time) {
      setState(() {
        if(currentIndex < onboardingImages.length - 1){
          currentIndex++;
        }else{
          currentIndex = 0;
        }
      });
    });
  }
  
  @override
  void initState() {
    super.initState();
    switchImage();
  }
  
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  height: 100,
                  "assets/images/onboarding/onboarding_four.png",
                  fit: BoxFit.contain,
                ),
                MediumSized(),
                SizedBox(
                  height: screenSize.height * 0.30,
                  width: double.infinity,
                  child: Center(
                    child: Image.asset(
                      onboardingImages[currentIndex],
                      fit: BoxFit.contain,
                      height: screenSize.height * 0.25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 70,
                        child: Header1Text(
                          text: onboardingTitle[currentIndex],
                          textAlign: TextAlign.center,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const MediumSized(),
                      SizedBox(
                        height: 70,
                        child: DescriptionText(
                          text: onboardingSubTitle[currentIndex],
                          textAlign: TextAlign.center,
                          fontSize: 14,
                          textColor: AppColors(context: context).nutural900(),
                        ),
                      ),
                      LargeSized(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingImages.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: currentIndex == index ? 24 : 8,
                            height: 6,
                            decoration: BoxDecoration(
                              color: currentIndex == index ? AppColors.primary : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      LargeSized(),
                      Center(
                        child: SizedBox(
                          width: 263,
                          height: 42,
                          child: AppButton(
                            text: 'Sign up',
                            onPressed: () {
                              context.go(SignupPage.routeName);
                            },
                            color: AppColors.primary,
                            textColor: Colors.white,
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                          ),
                        ),
                      ),
                      SmallSized(),
                      Center(
                        child: SizedBox(
                          width: 263,
                          height: 42,
                          child: AppButtonAlt(
                            text: 'Sign in',
                            textColor: AppColors(context: context).nutural900(),
                            onPressed: () {
                              context.push(SigninPage.routeName);
                            },
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                          ),
                        ),
                      ),
                      LargeSized(),
                      Center(
                        child: LinkText(
                          fontSize: 12.sp,
                          text: 'Continue as a guest',
                          textColor: AppColors(context: context).nutural900(),
                          onTap: () {
                            
                            // Add guest navigation logic here
                          },
                        ),
                      ),
                      ExtraLargeSized(),
                    ],
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
