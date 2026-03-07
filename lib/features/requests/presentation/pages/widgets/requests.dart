import 'package:flutter/material.dart';
import '../../manager/requests_cubit.dart';
import '../../manager/requests_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/widgets/m_button.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../data/models/request_friend_model.dart';
import '../../../../../core/widgets/mutual_friends.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_friend_image.dart';
import '../../../../../core/features/friends/data/models/friend_model.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsStates>(
      builder: (context, state) {
        if (state is RequestsLoadingState) {
          return _Loading(isLoading: true);
        } else {
          var cubit = RequestsCubit.get(context);
          var isSearching = cubit.isSearching;
          var users = isSearching ? cubit.searchResults : cubit.requests;
          return _Body(users: users);
        }
      },
    );
  }
}

class _Body extends StatelessWidget {
  final List<RequestFriendModel> users;
  const _Body({required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: users.length,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _Item(request: users[index]);
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
      (index) => RequestFriendModel(
        id: index,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isBlocked: false,
        status: "pending",
        requester: FriendModel(
          id: index,
          username: "Loading...",
          profileImage: "https://via.placeholder.com/150",
          bio: "Loading...",
          email: "loading@example.com",
          firstName: "Loading",
          lastName: "User",
          mutualFriends: [],
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
          return _Item(request: loadingItem[index]);
        },
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final RequestFriendModel request;

  const _Item({required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        child: Row(
          spacing: 12.w,
          children: [
            CustomFriendImage(
              profileImage: request.requester.profileImage,
              radius: 50.r,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Top(request: request),
                  MutualFriends(mutualFriends: request.requester.mutualFriends),
                  SizedBox(height: 10.h),
                  _Actions(request: request),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final RequestFriendModel request;
  const _Top({required this.request});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomText(
            text: request.requester.username,
            size: 20.sp,
            type: Type.medium,
            height: 1.3,
          ),
        ),
        CustomText(
          text: _formatDate(request.createdAt),
          size: 20.sp,
          type: Type.overMedium,
          opacity: FontOpacity.medium,
          height: 1.1,
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    var now = DateTime.now();
    var difference = now.difference(date);
    if (difference.inSeconds < 60) {
      return "${difference.inSeconds}s";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes}m";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}h";
    } else if (difference.inDays < 7) {
      return "${difference.inDays}d";
    } else {
      return "${difference.inDays ~/ 365}y";
    }
  }
}

class _Actions extends StatelessWidget {
  final RequestFriendModel request;
  const _Actions({required this.request});

  @override
  Widget build(BuildContext context) {
    var cubit = RequestsCubit.get(context);
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          child: MButton(
            height: 45.h,
            text: "Accept",
            onPressed: () {
              cubit.acceptFriendRequest(requestId: request.id);
            },
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: MButton(
            height: 45.h,
            text: "Decline",
            onPressed: () {},
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
