// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/m_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/profile_cubit.dart';
import '../../manager/profile_state.dart';

class ProfileForm extends StatelessWidget {
  final Key? formKey;
  final Key? formKey2;
  final AutovalidateMode autoValidate;
  final AutovalidateMode autoValidate2;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController nicknameController;
  final TextEditingController bioController;
  final TextEditingController confirmPasswordController;
  final bool isPasswordVisible;
  final VoidCallback onPasswordVisibilityToggle;

  final Function() onSubmit;
  const ProfileForm({
    super.key,
    required this.formKey,
    required this.formKey2,
    required this.autoValidate,
    required this.autoValidate2,
    required this.firstNameController,
    required this.lastNameController,
    required this.nicknameController,
    required this.bioController,
    required this.confirmPasswordController,
    required this.isPasswordVisible,
    required this.passwordController,
    required this.onPasswordVisibilityToggle,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) => Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: S.of(context).personalInfo,
            size: 20.sp,
            type: Type.overMedium,
          ),
          Form(
            key: formKey,
            autovalidateMode: autoValidate,
            child: Column(
              spacing: 15.h,
              children: [
                _Name(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                ),
                _NickName(nicknameController: nicknameController),
              ],
            ),
          ),
          _Bio(bioController: bioController),
          Form(
            key: formKey2,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: _Password(
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              isPasswordVisible: isPasswordVisible,
              onPasswordVisibilityToggle: onPasswordVisibilityToggle,
            ),
          ),
          _Button(onPressed: onSubmit),
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
          child: _NameItem(
            title: s.firstNameHint,
            hintText: s.firstNameHint,
            controller: firstNameController,
          ),
        ),
        Expanded(
          child: _NameItem(
            title: s.lastNameHint,
            hintText: s.lastNameHint,
            controller: lastNameController,
          ),
        ),
      ],
    );
  }
}

class _NameItem extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const _NameItem({
    required this.title,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          CustomText(text: title, size: 20.sp, type: Type.overSmall),
          Expanded(
            child: MTextFormField(
              hintText: hintText,
              controller: controller,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
    );
  }
}

class _NickName extends StatelessWidget {
  final TextEditingController nicknameController;
  const _NickName({required this.nicknameController});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        CustomText(text: s.nicknameHint, size: 20.sp, type: Type.overSmall),
        MTextFormField(
          hintText: s.nicknameHint,
          controller: nicknameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}

class _Bio extends StatelessWidget {
  final TextEditingController bioController;
  const _Bio({required this.bioController});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        CustomText(text: s.bioHint, size: 20.sp, type: Type.overSmall),
        MTextFormField(
          hintText: s.bioHint,
          controller: bioController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}

class _Password extends StatelessWidget {
  final bool isPasswordVisible;
  final VoidCallback onPasswordVisibilityToggle;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  const _Password({
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isPasswordVisible,
    required this.onPasswordVisibilityToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: S.of(context).changePasswordButton,
          size: 20.sp,
          type: Type.overMedium,
        ),
        MTextFormField(
          obscureText: !isPasswordVisible,
          hintText: S.of(context).passwordHint,
          controller: passwordController,
          suffixIcon: isPasswordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          suffixTap: onPasswordVisibilityToggle,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
        ),
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
  final Function() onPressed;
  const _Button({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 10.h , bottom: 20.h),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => MButton(
          isLoading: state is ProfileLoading,
          text: s.saveChanges,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
