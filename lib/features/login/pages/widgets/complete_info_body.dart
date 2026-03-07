// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/m_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/image_picker_service.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/features/auth/manager/auth_cubit.dart';
import '../../../../core/features/auth/manager/auth_state.dart';

class CompleteInfoBody extends StatelessWidget {
  const CompleteInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = AuthCubit.get(context);
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 10.h),
          _UserImage(),
          SizedBox(height: 40.h),
          Form(
            key: cubit.completeInfoKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: MTextFormField(controller: cubit.nickname, hintText: s.nicknameHint),
          ),
          SizedBox(height: 15.h),
          MTextFormField(
            height: 132.h,
            controller: cubit.bio,
            hintText: s.bioHint,
            maxLines: 5,
          ),
          Spacer(),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return MButton(
                isLoading: state is AuthLoadingState,
                text: s.completeProfileButton,
                onPressed: () async {
                  await cubit.completeInfoButton();
                },
              );
            },
          ),
          SizedBox(height: 20.h),
        ],
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        String? imagePath = authCubit.user.profileImagePath;
        return GestureDetector(
          onTap: () => ImageServices.updateProfile().then((value) {
            if (value.image != null) {
              authCubit.uploadProfileImage(
                image: value.image!,
                path: value.path!,
              );
            }
          }),
          child: CircleAvatar(
            radius: 60.r,
            backgroundColor: Colors.grey[300],
            backgroundImage: imagePath != null
                ? FileImage(File(imagePath))
                : null,
            child: imagePath == null
                ? Icon(
                    Icons.camera_alt_outlined,
                    size: 50.sp,
                    color: Colors.grey[700],
                  )
                : null,
          ),
        );
      },
    );
  }
}
