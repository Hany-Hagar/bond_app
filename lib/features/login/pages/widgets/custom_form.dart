// ignore_for_file: deprecated_member_use

import 'package:get_it/get_it.dart';
import '../views/register_view.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../views/forget_password_view.dart';
import '../../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/m_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/auth/manager/auth_state.dart';
import '../../../../core/services/social_media_auth_service.dart';

class CustomForm extends StatelessWidget {
  final Key? formKey;
  final bool isLogin;
  final AutovalidateMode autovalidateMode;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? confirmPasswordController;
  final bool isPasswordVisible;
  final VoidCallback onPasswordVisibilityToggle;
  final Function() onSubmit;
  const CustomForm({
    super.key,
    required this.formKey,
    this.isLogin = true,
    required this.autovalidateMode,
    required this.emailController,
    required this.passwordController,
    this.firstNameController,
    this.lastNameController,
    this.confirmPasswordController,
    required this.isPasswordVisible,
    required this.onPasswordVisibilityToggle,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 15.h,
        children: [
          if (!isLogin)
            _Name(
              firstNameController: firstNameController!,
              lastNameController: lastNameController!,
            ),
          MTextFormField(
            hintText: S.of(context).emailHint,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          _Password(
            isLogin: isLogin,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            isPasswordVisible: isPasswordVisible,
            onPasswordVisibilityToggle: onPasswordVisibilityToggle,
          ),
          if (isLogin) const _ForgetPassword(),
          _Button(isLogin: isLogin, onPressed: onSubmit),
          const _OrWith(isLogin: true),
          const _SocialMedia(),
          _End(isLogin: isLogin),
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  const _Name({
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      spacing: 15.w,
      children: [
        Expanded(
          child: MTextFormField(
            hintText: s.firstNameHint,
            controller: firstNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
        Expanded(
          child: MTextFormField(
            hintText: s.lastNameHint,
            controller: lastNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}

class _ForgetPassword extends StatelessWidget {
  const _ForgetPassword();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        onTap: () {
          NavTo.push(context: context, nextPage: ForgetPasswordView());
        },
        child: CustomText(
          text: S.of(context).forgotPassword,
          size: 18.sp,
          type: Type.overMedium,
          color: Styles.linkColor,
        ),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  final bool isLogin;
  final bool isPasswordVisible;
  final VoidCallback onPasswordVisibilityToggle;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  const _Password({
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isLogin,
    required this.isPasswordVisible,
    required this.onPasswordVisibilityToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        MTextFormField(
          obscureText: !isPasswordVisible,
          hintText: S.of(context).passwordHint,
          controller: passwordController,
          suffixIcon: isPasswordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          suffixTap: onPasswordVisibilityToggle,
          keyboardType: isLogin
              ? TextInputType.text
              : TextInputType.visiblePassword,
          textInputAction: isLogin
              ? TextInputAction.next
              : TextInputAction.done,
        ),
        if (!isLogin)
          MTextFormField(
            obscureText: !isPasswordVisible,
            hintText: S.of(context).confirmPasswordHint,
            controller: confirmPasswordController!,
            confirmPasswordController: passwordController,
            suffixIcon: isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            suffixTap: onPasswordVisibilityToggle,
            textInputAction: TextInputAction.done,

            keyboardType: TextInputType.visiblePassword,
          ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final bool isLogin;
  final Function() onPressed;
  const _Button({required this.onPressed, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return MButton(
            isLoading: state is AuthLoadingState,
            text: isLogin ? s.loginButton : s.registerButton,
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}

class _OrWith extends StatelessWidget {
  final bool isLogin;
  const _OrWith({required this.isLogin});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 30.h),
      child: Row(
        spacing: 10.w,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Divider(height: 1.h)),
          CustomText(
            text: isLogin ? s.orLoginWith : s.orRegisterWith,
            size: 14.sp,
            type: Type.medium,
            opacity: FontOpacity.overLow,
          ),
          Expanded(child: Divider(height: 1.h)),
        ],
      ),
    );
  }
}

class _SocialMedia extends StatelessWidget {
  const _SocialMedia();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        spacing: 20.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SocialMediaItem(
            iconPath: "assets/icons/facebook.png",
            onTap: () async {
              await GetIt.I<SocialMediaAuthService>().signInWithFacebook();
            },
          ),
          _SocialMediaItem(
            iconPath: "assets/icons/google.png",
            onTap: () async {
              await GetIt.I<SocialMediaAuthService>().signInWithGoogle();
            },
          ),
          //_SocialMediaItem(iconPath: "assets/icons/apple.png", onTap: () {}),
        ],
      ),
    );
  }
}

class _SocialMediaItem extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  const _SocialMediaItem({required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,

          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.2),
              blurRadius: 4.r,
            ),
          ],
        ),
        child: Center(child: Image.asset(iconPath, height: 35.r)),
      ),
    );
  }
}

class _End extends StatelessWidget {
  final bool isLogin;
  const _End({required this.isLogin});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      spacing: 6.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: isLogin ? s.dontHaveAnAccount : s.alreadyHaveAnAccount,
          size: 16.sp,
          type: Type.medium,
        ),
        GestureDetector(
          onTap: () {
            if (isLogin) {
              NavTo.push(context: context, nextPage: RegisterView());
            } else {
              NavTo.pop(context);
            }
          },
          child: CustomText(
            text: isLogin ? s.registerNow : s.loginNow,
            size: 16.sp,
            type: Type.overMedium,
            color: Styles.linkColor,
          ),
        ),
      ],
    );
  }
}
