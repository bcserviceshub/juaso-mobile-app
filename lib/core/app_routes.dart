import 'package:go_router/go_router.dart';
import 'package:juaso/features/auth/presentation/pages/signin/forgot_password_page.dart';
import 'package:juaso/features/auth/presentation/pages/signin/password_verification_email.dart';
import 'package:juaso/features/auth/presentation/pages/signup/signup_page.dart';
import 'package:juaso/features/auth/presentation/pages/signup/signup_confirm_email.dart';
import 'package:juaso/features/auth/presentation/pages/signup/signup_confirm_phone.dart';
import 'package:juaso/features/onboarding/view/onboarding_page.dart';
import 'package:juaso/features/splash_screen/splash_screen.dart';
import 'package:juaso/features/auth/presentation/pages/signin/signin_page.dart';

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: SignupConfirmEmail.routeName,
      builder: (context, state) => const SignupConfirmEmail(),
    ),
    GoRoute(
      path: SignupConfirmPhone.routeName,
      builder: (context, state) => const SignupConfirmPhone(),
    ),
    GoRoute(
      path: SigninPage.routeName,
      builder: (context, state) => const SigninPage(),
    ),
    GoRoute(
      path: ForgotPasswordPage.routeName,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: PasswordVerficationEmail.routeName,
      builder: (context, state) => const PasswordVerficationEmail(),
    )
  ]
);