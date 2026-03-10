<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../manager/explores_cubit.dart';
import '../../manager/explores_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/empty.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/explore_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/mutual_friends.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../friends/pages/friend_profile_view.dart';
=======
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
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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
<<<<<<< HEAD
          return _Body(isSearching: isSearching, users: users);
=======
          return _Body(users: users);
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
        }
      },
    );
  }
}

<<<<<<< HEAD
=======
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

>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
class _Loading extends StatelessWidget {
  final bool isLoading;
  const _Loading({required this.isLoading});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    var loadingItem = List.generate(5, (index) => ExploreModel.empty());
=======
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
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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

<<<<<<< HEAD
class _Body extends StatelessWidget {
  final bool isSearching;
  final List<ExploreModel> users;
  const _Body({required this.isSearching, required this.users});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    if (users.isEmpty) {
      return Empty(
        isSearching: isSearching,
        imagePath: 'assets/images/empty_users.png',
        message: s.exploreEmpty,
        searchMessage: s.exploreEmptySearch,
      );
    }
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

=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
class _Item extends StatelessWidget {
  final ExploreModel user;
  const _Item({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
<<<<<<< HEAD
      onTap: () {
        NavTo.push(context: context, nextPage: FriendProfileView());
      },
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
      minTileHeight: 30.h,
      horizontalTitleGap: 10.w,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      tileColor: Theme.of(context).scaffoldBackgroundColor,
      leading: CustomFriendImage(profileImage: user.profileImage),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
<<<<<<< HEAD
      subtitle: MutualFriends(mutualFriends: user.mutualFriends),
      title: CustomText(text: user.username, size: 20.sp, type: Type.medium),
      trailing: _Icons(explore: user),
    );
  }
}

class _Icons extends StatelessWidget {
  final ExploreModel explore;
  const _Icons({required this.explore});

  @override
  Widget build(BuildContext context) {
    var cubit = ExploresCubit.get(context);
    var isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (explore.isFriend)
          _Icon(
            userId: explore.id, 
            scaleX: isArabic ? -1.0 : 1.0,
            icon: CupertinoIcons.chat_bubble_fill
            ),
        if (explore.sentFriendRequest)
          _Icon(
            userId: explore.requestId!,
            icon: Icons.person_remove_alt_1,
            scaleX: isArabic ? 1.0 : -1.0,
            loadingState: CancelFriendRequestLoadingState(userId: explore.id),
            onPressed: () {
              cubit.cancleFriendRequest(requestId: explore.requestId!);
            },
          ),
        if (explore.receivedFriendRequest)
          _Icon(
            userId: explore.id,
            scaleX: isArabic ? -1.0 : 1.0,
            loadingState: AcceptFriendRequestLoadingState(userId: explore.id),
            icon: Icons.person_add,
            onPressed: () {
            },
          ),

        if (!explore.isFriend &&
            !explore.sentFriendRequest &&
            !explore.receivedFriendRequest)
          _Icon(
            userId: explore.id,
            scaleX: isArabic ? -1.0 : 1.0,
            loadingState: SendFriendRequestLoadingState(userId: explore.id),
            icon: Icons.person_add,
            onPressed: () {
              cubit.sendFriendRequest(userId: explore.id);
            },
          ),
      ],
=======
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
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
    );
  }
}

class _Icon extends StatelessWidget {
<<<<<<< HEAD
  final int userId;
  final IconData icon;
  final Function()? onPressed;
  final ExploresStates? loadingState;
  final double scaleX;
  const _Icon({
    required this.userId,
    this.loadingState,
    required this.icon,
    this.onPressed,
    this.scaleX = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    var color = Styles.linkColor;
    return BlocBuilder<ExploresCubit, ExploresStates>(
      builder: (context, state) {
        var isLoading = loadingState == null
            ? false
            : state.runtimeType == loadingState.runtimeType &&
                  (state as dynamic).userId == userId;
        return isLoading
            ? SizedBox(
                width: 35.w,
                height: 35.h,
                child: CircularProgressIndicator(
                  color: color,
                  strokeWidth: 3.w,
                ),
              )
            : Transform.scale(
                scaleX: scaleX,
                child: GestureDetector(
                  onTap: onPressed,
                  child: Icon(icon, size: 38.sp, color: color),
                ),
              );
      },
=======
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
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
    );
  }
}
