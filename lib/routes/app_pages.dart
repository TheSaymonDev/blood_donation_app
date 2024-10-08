import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/about_us_screen/about_us_screen.dart';
import 'package:free_blood_donation/screens/blood_seeker_details_screen/blood_seeker_details_screen.dart';
import 'package:free_blood_donation/screens/donor_group_screen/donor_group_screen.dart';
import 'package:free_blood_donation/screens/feed_screen/bindings/feed_binding.dart';
import 'package:free_blood_donation/screens/home_screen/bindings/home_binding.dart';
import 'package:free_blood_donation/screens/home_screen/home_screen.dart';
import 'package:free_blood_donation/screens/login_screen/bindings/login_binding.dart';
import 'package:free_blood_donation/screens/login_screen/login_screen.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/bindings/mobile_verification_binding.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/mobile_verification_screen.dart';
import 'package:free_blood_donation/screens/nearby_donor_screen/nearby_donor_screen.dart';
import 'package:free_blood_donation/screens/no_internet_screen/bindings/no_internet_binding.dart';
import 'package:free_blood_donation/screens/no_internet_screen/no_internet_screen.dart';
import 'package:free_blood_donation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:free_blood_donation/screens/otp_verification_screen/bindings/otp_verification_binding.dart';
import 'package:free_blood_donation/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:free_blood_donation/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:free_blood_donation/screens/profile_screen/bindings/profile_binding.dart';
import 'package:free_blood_donation/screens/profile_update_screen/bindings/profile_update_binding.dart';
import 'package:free_blood_donation/screens/profile_update_screen/profile_update_screen.dart';
import 'package:free_blood_donation/screens/registration_screen/bindings/registration_binding.dart';
import 'package:free_blood_donation/screens/registration_screen/registration_screen.dart';
import 'package:free_blood_donation/screens/request_screen/bindings/request_binding.dart';
import 'package:free_blood_donation/screens/seeker_post_screen/bindings/seeker_post_binding.dart';
import 'package:free_blood_donation/screens/seeker_post_screen/seeker_post_screen.dart';
import 'package:free_blood_donation/screens/splash_screen/bindings/splash_binding.dart';
import 'package:free_blood_donation/screens/splash_screen/splash_screen.dart';
import 'package:free_blood_donation/screens/top_donor_screen/top_donor_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.initialRoute,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.noInternetScreen,
        page: () => const NoInternetScreen(),
        binding: NoInternetBinding()),
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
        name: AppRoutes.registrationScreen,
        page: () => RegistrationScreen(),
        binding: RegistrationBinding()),
    GetPage(
        name: AppRoutes.mobileVerificationScreen,
        page: () => MobileVerificationScreen(),
        binding: MobileVerificationBinding()),
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.otpVerificationScreen,
        page: () => OtpVerificationScreen(),
        binding: OtpVerificationBinding()),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
        FeedBinding(),
        RequestBinding(),
        ProfileBinding()
      ],
    ),
    GetPage(
        name: AppRoutes.seekerPostScreen,
        page: () => SeekerPostScreen(),
        binding: SeekerPostBinding()),
    GetPage(
        name: AppRoutes.profileUpdateScreen,
        page: () => ProfileUpdateScreen(),
        binding: ProfileUpdateBinding()),
    GetPage(
      name: AppRoutes.nearbyDonorScreen,
      page: () => const NearbyDonorScreen(),
    ),
    GetPage(
      name: AppRoutes.donorGroupScreen,
      page: () => const DonorGroupScreen(),
    ),
    GetPage(
      name: AppRoutes.aboutUsScreen,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: AppRoutes.topDonorScreen,
      page: () => const TopDonorScreen(),
    ),
    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: () => const PrivacyPolicyScreen(),
    ),
    GetPage(
      name: AppRoutes.bloodSeekerDetailsScreen,
      page: () => const BloodSeekerDetailsScreen(),
    ),
  ];
}
