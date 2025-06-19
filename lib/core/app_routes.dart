import 'package:go_router/go_router.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bb/signup/business_signup.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bb/signup/widgets/business_registration_complete.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/enter_new_password.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/forgot_password_page.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/password_verification_email.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signup/signup_page.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signup/signup_confirm_email.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signup/signup_confirm_phone.dart';
import 'package:juaso_mobile_app/features/home_page/screen/home_page.dart';
import 'package:juaso_mobile_app/features/onboarding/view/onboarding_page.dart';
import 'package:juaso_mobile_app/features/splash_screen/splash_screen.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/signin/signin_page.dart';

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage() ,
    ),
     GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: BusinessSignup.routeName,
      builder: (context, state) => const BusinessSignup(),
      
      ),
    GoRoute(
      path: OnboardingPage.routeName,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: SignupPage.routeName,
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
    ),
    GoRoute(
      path: EnterNewPassword.routeName,
      builder: (context, state) => const EnterNewPassword(),
    ),
    GoRoute(
      path: BusinessRegistrationComplete.routeName,
      name: BusinessRegistrationComplete.routeName,
      builder: (context, state) => const BusinessRegistrationComplete(),
    ),
   
   
  ]
);
