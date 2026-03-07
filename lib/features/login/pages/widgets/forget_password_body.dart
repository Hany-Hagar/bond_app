import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/m_button.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = AuthCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        _Top(),
        MTextFormField(
          hintText: s.emailHint,
          controller: TextEditingController(),
        ),
        SizedBox(height: 20.h),
        MButton(
          text: s.resetPasswordButton,
          onPressed: () {
            cubit.sendResetPasswordEmail();
          },
        ),
        SizedBox(height: 20.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: s.notReceivedEmail,
              size: 16.sp,
              type: Type.overMedium,
              opacity: FontOpacity.medium,
            ),
            CustomText(
              text: s.resendEmail,
              size: 16.sp,
              type: Type.overMedium,
              color: Styles.linkColor,
            ),
          ],
        ),
      ],
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      spacing: 0.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: s.forgetPasswordTitle, size: 25.sp, type: Type.header),
        CustomText(
          text: s.forgetPasswordSubTitle,
          size: 16.sp,
          maxLines: 5,
          type: Type.medium,
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
