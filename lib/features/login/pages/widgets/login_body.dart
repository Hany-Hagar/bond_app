// ignore_for_file: deprecated_member_use
import 'custom_form.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_app_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/auth/manager/auth_state.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.12),
        _Top(),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CustomForm(
              formKey: cubit.loginKey,
              autovalidateMode: cubit.loginAutoValidateMode,
              emailController: cubit.loginEmail,
              passwordController: cubit.loginPassword,
              isPasswordVisible: cubit.loginPasswordVisible,
              onPasswordVisibilityToggle: () {
                cubit.changeLoginPasswordVisibility();
              },
              onSubmit: () async {
                cubit.login();
              },
            );
          },
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
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8.w,
          children: [
            CustomText(text: s.loginTitle, size: 28.sp, type: Type.header),
            const CustomAppLogo(height: 50,),
          ],
        ),
        CustomText(
          text: s.loginSubTitle,
          size: 18.sp,
          type: Type.medium,
          maxLines: 3,
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
