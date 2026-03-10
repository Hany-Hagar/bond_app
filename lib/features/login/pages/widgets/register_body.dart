// ignore_for_file: deprecated_member_use

import 'custom_form.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/features/auth/manager/auth_state.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
          builder: (context, state) => CustomForm(
            isLogin: false,
            autovalidateMode: cubit.registerAutoValidateMode,
            formKey: cubit.registerKey,
            emailController: cubit.registerEmail,
            passwordController: cubit.registerPassword,
            firstNameController: cubit.registerFirstName,
            lastNameController: cubit.registerLastName,
            confirmPasswordController: cubit.registerConfirmPassword,
            isPasswordVisible: cubit.registerPasswordVisible,
            onPasswordVisibilityToggle: () {
              cubit.changeRegisterPasswordVisibility();
            },
            onSubmit: () async {
              await cubit.register();
            },
          ),
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
        CustomText(text: s.registerTitle, size: 25.sp, type: Type.header),
        CustomText(
          text: s.registerSubTitle,
          size: 16.sp,
          type: Type.medium,
          maxLines: 3,
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
