import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/friend_detail_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/mutual_friends.dart';
import '../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/features/friends/manager/friends_cubit.dart';
import '../../../core/features/friends/manager/friends_states.dart';
import '../../../core/features/friends/data/models/friend_model.dart';
import 'package:ibond_application/core/widgets/custom_friend_image.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsCubit, FriendsStates>(
      builder: (context, state) {
        if (state is FriendsLoadingState) {
          return const _Loading();
        } else {
          var cubit = FriendsCubit.get(context);
          var isSearching = cubit.isSearching;
          var friends = isSearching ? cubit.searchResults : cubit.friends;
          return _Body(friends: friends);
        }
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    var friends = List.generate(5, (index) => FriendModel.loading());
    return Skeletonizer(child: _Body(friends: friends));
  }
}

class _Body extends StatelessWidget {
  final List<FriendModel> friends;
  const _Body({required this.friends});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var friend = friends[index];
        return _Item(friend: friend);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: friends.length,
    );
  }
}

class _Item extends StatelessWidget {
  final FriendModel friend;
  const _Item({required this.friend});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var name = friend.username;
    return ListTile(
      onTap: () {
        NavTo.push(
          context: context,
          nextPage: FriendDetailView(friend: friend),
        );
      },
      tileColor: theme.scaffoldBackgroundColor,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      leading: CustomFriendImage(
        profileImage: friend.profileImage,
        radius: 27.r,
      ),
      title: CustomText(text: name, size: 20.sp, type: Type.overMedium),
      subtitle: MutualFriends(mutualFriends: []),
      trailing: const _Trailing(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    );
  }
}

class _Trailing extends StatelessWidget {
  const _Trailing();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(CupertinoIcons.chat_bubble_fill, size: 30.sp),
    );
  }
}
