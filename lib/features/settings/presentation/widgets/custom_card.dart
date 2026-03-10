import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String emoji;
  final String? subtitle1;
  final String? content1;
  final String? subtitle2;
  final String? content2;
  final Widget? child;
  const CustomCard({
    super.key,
    required this.title,
    required this.emoji,
    this.subtitle1,
    this.content1,
    this.subtitle2,
    this.content2,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(text: emoji, size: 20.sp),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomText(
                  text: title,
                  size: 20.sp,
                  maxLines: 2,
                  type: Type.header,
                ),
              ),
            ],
          ),
          if (subtitle1 != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomText(
                text: subtitle1!,
                size: 18.sp,
                maxLines: 4,
                type: Type.medium,
              ),
            ),
          if (content1 != null)
            CustomText(
              text: content1!,
              size: 16.sp,
              maxLines: 10,
              opacity: FontOpacity.medium,
            ),
          if (subtitle2 != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomText(
                text: subtitle2!,
                maxLines: 5,
                size: 18.sp,
                type: Type.medium,
              ),
            ),
          if (content2 != null)
            CustomText(
              text: content2!,
              size: 16.sp,
              maxLines: 10,
              opacity: FontOpacity.medium,
            ),
          ?child,
        ],
      ),
    );
  }
}
