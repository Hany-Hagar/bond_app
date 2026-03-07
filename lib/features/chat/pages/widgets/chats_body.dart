import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/features/friends/manager/friends_states.dart';
import 'lists/chats.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../friends/pages/friend_detail_view.dart';
import '../../../../core/widgets/custom_friend_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/features/friends/manager/friends_cubit.dart';
import '../../../../core/features/friends/data/models/friend_model.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        BlocBuilder<FriendsCubit, FriendsStates>(
          builder: (context, state) =>
              _HomeFriends(friends: FriendsCubit.get(context).friends),
        ),
        SizedBox(height: 10.h),
        Chats(),
      ],
    );
  }
}

class _HomeFriends extends StatelessWidget {
  final List<FriendModel> friends;
  const _HomeFriends({required this.friends});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: friends.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              NavTo.push(
                context: context,
                nextPage: FriendDetailView(friend: friends[index]),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFriendImage(
                  profileImage: friends[index].profileImage,
                  radius: 30.r,
                ),
                SizedBox(height: 5.h),
                CustomText(
                  text: friends[index].firstName,
                  size: 20.sp,
                  type: Type.overMedium,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15.w);
        },
      ),
    );
  }
}
