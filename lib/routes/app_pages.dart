import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/about_us_screen/about_us_screen.dart';
import 'package:free_blood_donation/screens/add_request_screen/add_request_screen.dart';
import 'package:free_blood_donation/screens/donor_group_screen/donor_group_screen.dart';
import 'package:free_blood_donation/screens/feed_screen/feed_screen.dart';
import 'package:free_blood_donation/screens/history_screen/history_screen.dart';
import 'package:free_blood_donation/screens/home_screen/bindings/home_binding.dart';
import 'package:free_blood_donation/screens/home_screen/home_screen.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/mobile_verification_screen.dart';
import 'package:free_blood_donation/screens/nearby_donor_screen/nearby_donor_screen.dart';
import 'package:free_blood_donation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:free_blood_donation/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:free_blood_donation/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:free_blood_donation/screens/profile_screen/profile_screen.dart';
import 'package:free_blood_donation/screens/profile_update_screen/profile_update_screen.dart';
import 'package:free_blood_donation/screens/registration_screen/registration_screen.dart';
import 'package:free_blood_donation/screens/request_screen/request_screen.dart';
import 'package:free_blood_donation/screens/splash_screen/bindings/splash_binding.dart';
import 'package:free_blood_donation/screens/splash_screen/splash_screen.dart';
import 'package:free_blood_donation/screens/top_donor_screen/top_donor_screen.dart';
import 'package:get/get.dart';

class AppPages{
  static final pages = [
    GetPage(name: AppRoutes.initialRoute, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: AppRoutes.onboardingScreen, page: () => OnboardingScreen(),),
    GetPage(name: AppRoutes.registrationScreen, page: () => const RegistrationScreen(),),
    GetPage(name: AppRoutes.mobileVerificationScreen, page: () =>  MobileVerificationScreen(),),
    GetPage(name: AppRoutes.otpVerificationScreen, page: () => const OtpVerificationScreen(),),
    GetPage(name: AppRoutes.homeScreen, page: () =>  const HomeScreen(), binding: HomeBinding()),
    GetPage(name: AppRoutes.feedScreen, page: () =>  FeedScreen(),),
    GetPage(name: AppRoutes.requestScreen, page: () => const RequestScreen(),),
    GetPage(name: AppRoutes.addRequestScreen, page: () => const AddRequestScreen(),),
    GetPage(name: AppRoutes.historyScreen, page: () => const HistoryScreen(),),
    GetPage(name: AppRoutes.profileScreen, page: () => const ProfileScreen(),),
    GetPage(name: AppRoutes.profileUpdateScreen, page: () => const ProfileUpdateScreen(),),
    GetPage(name: AppRoutes.nearbyDonorScreen, page: () => const NearbyDonorScreen(),),
    GetPage(name: AppRoutes.donorGroupScreen, page: () => const DonorGroupScreen(),),
    GetPage(name: AppRoutes.aboutUsScreen, page: () => const AboutUsScreen(),),
    GetPage(name: AppRoutes.topDonorScreen, page: () => const TopDonorScreen(),),
    GetPage(name: AppRoutes.privacyPolicyScreen, page: () => const PrivacyPolicyScreen(),),
  ];
}