// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../data/model/on_boarding.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  final OnBoarding onBoarding;
  const OnBoardingBody({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        CustomText(text: onBoarding.title, size: 28.sp, type: Type.header),
        SizedBox(height: 5.h),
        CustomText(
          text: onBoarding.description,
          size: 17.sp,
          type: Type.medium,
          maxLines: 5,
        ),
        Spacer(),
        Image.asset(
          onBoarding.image,
          height: 327.h,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Spacer(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
