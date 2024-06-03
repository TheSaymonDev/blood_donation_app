import 'package:flutter/material.dart';
import 'package:free_blood_donation/utils/app_urls.dart';

class OnboardingData {
  final String title;
  final String subTitle;
  final String imgPath;
  final Color color;

  OnboardingData(
      {required this.title,
      required this.subTitle,
      required this.imgPath,
      required this.color});

  static List<OnboardingData> screenData = [
    OnboardingData(
        title: 'screen1Title',
        subTitle: 'screen1SubTitle',
        imgPath: AppUrls.screen1Json,
        color: const Color(0xFF678CEC)),
    OnboardingData(
        title: 'screen2Title',
        subTitle: 'screen2SubTitle',
        imgPath: AppUrls.screen2Json,
        color: const Color(0xFFE87A5D)),
    OnboardingData(
        title: 'screen3Title',
        subTitle: 'screen3SubTitle',
        imgPath: AppUrls.screen3Json,
        color: const Color(0xFFF3B941))
  ];
}
