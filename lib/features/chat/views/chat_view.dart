import '../widgets/chat_body.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_friend_image.dart';
import '../../../core/features/auth/data/models/user_model.dart';

class ChatView extends StatelessWidget {
  final UserModel user;
  const ChatView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      top: _Top(user: user),
      body: ChatBody(),
    );
  }
}

class _Top extends StatelessWidget {
  final UserModel user;
  const _Top({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 10.w,
        top: MediaQuery.of(context).padding.top + 10.h,
        bottom: 8.h,
      ),
      child: Row(
        spacing: 10.w,
        children: [
          _StartTop(user: user),
          _BodyTop(user: user),
          _EndTop(),
        ],
      ),
    );
  }
}

class _StartTop extends StatelessWidget {
  final UserModel user;
  const _StartTop({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined, size: 24.sp),
        ),
        SizedBox(width: 10.w),
        CustomFriendImage(
          profileImage: user.profileImageUrl ?? "",
          radius: 27.r,
        ),
      ],
    );
  }
}

class _BodyTop extends StatelessWidget {
  final UserModel user;
  const _BodyTop({required this.user});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: user.username ?? "Unknown User",
            size: 20.sp,
            type: Type.header,
          ),
          CustomText(
            text: "Online",
            size: 14.sp,
            type: Type.overMedium,
            opacity: FontOpacity.medium,
          ),
        ],
      ),
    );
  }
}

class _EndTop extends StatelessWidget {
  const _EndTop();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.call_outlined, size: 36.sp),
        SizedBox(width: 10.w),
        Icon(Icons.videocam_outlined, size: 36.sp),
        SizedBox(width: 10.w),
        Icon(Icons.more_vert_rounded, size: 36.sp),
        SizedBox(width: 10.w),
      ],
    );
  }
}
