import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:juaso_mobile_app/core/utils/user_preferences.dart';
import 'package:juaso_mobile_app/features/onboarding/view/onboarding_page.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
// Route name for onboarding

class SplashScreen extends StatefulWidget {
  static String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeTheme();
    });
  }

  Future<void> _initializeTheme() async {
    await UserPreferences.getTheme(context);
    if (mounted) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          context.go(OnboardingPage.routeName);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors(context: context).background(),
      body: Center(
          child: SvgPicture.asset(
        "assets/images/splash_screen/juaso_logo.svg",
        height: 78,
        width: 249,
        fit: BoxFit.contain,
      ).animate().fade(
                delay: const Duration(milliseconds: 300),
              )),
    );
  }
}
