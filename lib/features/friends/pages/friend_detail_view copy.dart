// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widgets/friend_details_body.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../const_data/api_const_data.dart';
import '../../../core/widgets/custom_background.dart';
import '../../../core/widgets/custom_friend_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/features/friends/data/models/friend_model.dart';

class FriendDetailView extends StatelessWidget {
  final FriendModel friend;
  const FriendDetailView({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return BackGround(
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _Top(expandedHeight: size.height * 0.25, friend: friend),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: FriendDetailsBody(friend: friend),
            ),
          ),
        ],
      ),
    );
  }
}

class _Top extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final FriendModel friend;
  _Top({required this.friend, required this.expandedHeight});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double opacity = 1 - (shrinkOffset / expandedHeight).clamp(0.0, 1.0);
    final double appearanceOpacity =
        (shrinkOffset / (expandedHeight - minExtent)).clamp(0.0, 1.0);
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Opacity(
            opacity: opacity,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: profileImageBaseUrl + (friend.profileImage),
            ),
          ),
        ),
        _TopAppBar(opacity: appearanceOpacity, friend: friend),
        Positioned(
          bottom: -120.h,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: opacity,
            child: Column(children: [_Image(friend: friend)]),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 35.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _TopAppBar extends StatelessWidget {
  final double opacity;
  final FriendModel friend;
  const _TopAppBar({required this.opacity, required this.friend});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return PositionedDirectional(
      start: 16.w,
      top: MediaQuery.of(context).padding.top + 10.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              size: 28.sp,
              Icons.arrow_back_ios,
              color: theme.hintColor,
            ),
          ),
          SizedBox(width: 10.w),
          Opacity(
            opacity: opacity,
            child: Row(
              children: [
                CustomFriendImage(
                  profileImage: friend.profileImage,
                  radius: 28.r,
                ),
                SizedBox(width: 10.w),
                CustomText(
                  text: friend.username,
                  size: 26.sp,
                  type: Type.overMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final FriendModel friend;
  const _Image({required this.friend});

  @override
  Widget build(BuildContext context) {
    var text =
        friend.firstName[0].toUpperCase() + friend.lastName[0].toUpperCase();
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CustomFriendImage(profileImage: friend.profileImage, radius: 80.r),
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: CircleAvatar(
            radius: 26.r,
            backgroundColor: Theme.of(context).primaryColor,
            child: CustomText(
              text: text,
              size: 24.sp,
              color: Colors.white,
              type: Type.overMedium,
            ),
          ),
        ),
      ],
    );
  }
}
