// ignore_for_file: use_build_context_synchronously

import 'profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../manager/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_user_image.dart';
import '../../../../../core/services/image_picker_service.dart';
import '../../../../../core/features/auth/manager/auth_state.dart';
import '../../../../../core/features/auth/manager/auth_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return Column(
      spacing: 20.h,
      children: [
        SizedBox(height: 1),
        _Image(),
<<<<<<< HEAD
        ProfileForm(
=======
                ProfileForm(
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
          formKey: cubit.formKey,
          formKey2: cubit.formKey2,
          autoValidate: cubit.autoValidate,
          autoValidate2: cubit.autoValidate2,
          passwordController: cubit.passwordController,
          firstNameController: cubit.firstNameController,
          lastNameController: cubit.lastNameController,
          nicknameController: cubit.nicknameController,
          bioController: cubit.bioController,
          confirmPasswordController: cubit.confirmPasswordController,
          isPasswordVisible: cubit.isPasswordVisible,
          onPasswordVisibilityToggle: () => cubit.togglePasswordVisibility(),
          onSubmit: cubit.submit,
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsetsDirectional.only(bottom: 6.h, end: 8.w),
<<<<<<< HEAD
              child: CustomUserImage(radius: 80.r),
=======
              child: CustomUserImage(radius: 60.r),
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
            );
          },
        ),
        GestureDetector(
          onTap: () => ImageServices.updateProfile().then((value) {
            if (value.image != null) {
              AuthCubit.get(
                context,
              ).uploadProfileImage(image: value.image!, path: value.path!);
            }
          }),
          child: CircleAvatar(
            radius: 25.r,

            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Icon(
              CupertinoIcons.camera,
              size: 25.r,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
<<<<<<< HEAD
=======

>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
