import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/widgets/m_button.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

var isPasswordVisible = false;

class ResetYourPasswordBody extends StatelessWidget {
  const ResetYourPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.12),
        _Top(),
        MTextFormField(
          obscureText: !isPasswordVisible,
          hintText: S.of(context).passwordHint,
          controller: TextEditingController(),
          suffixIcon: isPasswordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          suffixTap: () {},
        ),
        SizedBox(height: 20.h),
        MTextFormField(
          obscureText: !isPasswordVisible,
          hintText: S.of(context).confirmPasswordHint,
          controller: TextEditingController(),
          suffixIcon: isPasswordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          suffixTap: () {},
        ),
        SizedBox(height: 20.h),
        MButton(
          text: S.of(context).changePasswordButton,
          onPressed: () async {},
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: s.resetPasswordTitle, size: 25.sp, type: Type.header),
        CustomText(
          text: s.resetPasswordSubTitle,
          size: 16.sp,
          type: Type.medium,
          maxLines: 3,
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
