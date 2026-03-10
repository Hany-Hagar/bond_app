import '../../views/chat_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../../core/widgets/custom_format_date.dart';
import '../../../../core/widgets/custom_friend_image.dart';
import '../../../../core/features/chats/data/models/chat_model.dart';

class Item extends StatelessWidget {
  final ChatModel chat;
  const Item({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavTo.push(
        context: context,
        nextPage: ChatView(user: chat.friend),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomFriendImage(
            profileImage: chat.friend.profileImagePath ?? "",
            radius: 27.r,
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Title(chat: chat),
                CustomText(text: "", size: 20),
                // _Subtitle(chat: chat),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final ChatModel chat;

  const _Title({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomText(
            text: chat.friend.username ?? "Unknown User",
            size: 20.sp,
            type: Type.header,
          ),
        ),
        CustomText(
          text: CustomFormatDate.item(time: chat.updatedAt, context: context),
          size: 15.sp,
          type: Type.header,
          opacity: FontOpacity.overLow,
        ),
      ],
    );
  }
}
