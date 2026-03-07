import 'package:flutter/widgets.dart';
import '../../../../generated/l10n.dart';

class OnBoarding {
  final String image;
  final String title;
  final String description;

  OnBoarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoarding> onBoardingData({required BuildContext context}) {
  var s = S.of(context);
  return [
    OnBoarding(
      image: 'assets/images/onBoarding1.png',
      title: s.onBoardingTitle1,
      description: s.onBoardingSubTitle1,
    ),
    OnBoarding(
      image: 'assets/images/onBoarding2.png',
      title: s.onBoardingTitle2,
      description: s.onBoardingSubTitle2,
    ),
    OnBoarding(
      image: 'assets/images/onBoarding3.png',
      title: s.onBoardingTitle3,
      description: s.onBoardingSubTitle3,
    ),
  ];
}
