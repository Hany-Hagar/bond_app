// ignore_for_file: deprecated_member_use

import '../../data/models/faq_model.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../data/models/support_call_model.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/services/url_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_Supports(), _Faqs()],
      ),
    );
  }
}

class _Supports extends StatelessWidget {
  const _Supports();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: supportCalls(context: context).length,
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (context, index) {
            return _SupportItem(model: supportCalls(context: context)[index]);
          },
        ),
      ],
    );
  }
}

class _SupportItem extends StatelessWidget {
  final SupportCallModel model;
  const _SupportItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => UrlService().openUrl(model.url),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: model.iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(model.icon, color: model.iconColor),
      ),

      tileColor: Theme.of(context).scaffoldBackgroundColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      title: CustomText(text: model.title, size: 18.sp, maxLines: 3),
      subtitle: CustomText(
        text: model.subTitle,
        size: 16.sp,
        type: Type.medium,
        opacity: FontOpacity.medium,
        maxLines: 5,
      ),
    );
  }
}

class _Faqs extends StatelessWidget {
  const _Faqs();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(text: s.faqQuestions, size: 16),
        SizedBox(height: 10.h),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: faqList().length,
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (context, index) {
            final faq = faqList()[index];
            return _FaqItem(title: faq.question, subTitle: faq.answer);
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const _FaqItem({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: theme.hintColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(Icons.question_answer, color: theme.hintColor),
      ),
      title: CustomText(text: title, size: 18.sp, maxLines: 3),
      backgroundColor: theme.scaffoldBackgroundColor,
      tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      childrenPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      collapsedBackgroundColor: theme.scaffoldBackgroundColor,
      children: [
        CustomText(
          text: subTitle,
          size: 16.sp,
          type: Type.medium,
          opacity: FontOpacity.medium,
          maxLines: 5,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
