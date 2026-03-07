import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../manager/explores_cubit.dart';
import '../../manager/explores_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/explore_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../data/models/mutual_friend_model.dart';
import '../../../../../core/widgets/mutual_friends.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_friend_image.dart';

class ExploreFriends extends StatelessWidget {
  const ExploreFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploresCubit, ExploresStates>(
      builder: (context, state) {
        if (state is ExploreLoadingState) {
          return _Loading(isLoading: true);
        } else {
          var cubit = ExploresCubit.get(context);
          var isSearching = cubit.isSearching;
          var users = isSearching ? cubit.searchResults : cubit.exploreUsers;
          return _Body(users: users);
        }
      },
    );
  }
}

class _Body extends StatelessWidget {
  final List<ExploreModel> users;
  const _Body({required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: users.length,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _Item(user: users[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
    );
  }
}

class _Loading extends StatelessWidget {
  final bool isLoading;
  const _Loading({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    var loadingItem = List.generate(
      5,
      (index) => ExploreModel(
        id: index,
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        profileImage: '',
        bio: '',
        mutualFriends: List.generate(
          5,
          (index) => MutualFriendModel(
            id: index,
            firstName: '',
            lastName: '',
            username: '',
            email: '',
            profileImage: '',
          ),
        ),
      ),
    );
    return Skeletonizer(
      enabled: isLoading,
      ignoreContainers: true,
      ignorePointers: true,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _Item(user: loadingItem[index]);
        },
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ExploreModel user;
  const _Item({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 30.h,
      horizontalTitleGap: 10.w,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      tileColor: Theme.of(context).scaffoldBackgroundColor,
      leading: CustomFriendImage(profileImage: user.profileImage),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      subtitle: MutualFriends(mutualFriends: user.mutualFriends ?? []),
      title: CustomText(text: user.username, size: 20.sp, type: Type.medium),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Icon(
            icon: Icons.person_add,
            onPressed: () {
              ExploresCubit.get(context).sendFriendRequest(userId: user.id);
            },
          ),
          SizedBox(width: 10.w),
          _Icon(icon: CupertinoIcons.chat_bubble_fill, onPressed: () {}),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  const _Icon({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Color(0xffCCE5FF),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, size: 30.sp, color: Theme.of(context).hintColor),
      ),
    );
  }
}
