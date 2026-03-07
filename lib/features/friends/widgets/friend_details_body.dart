// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/features/friends/data/models/friend_model.dart';

class FriendDetailsBody extends StatelessWidget {
  final FriendModel friend;
  const FriendDetailsBody({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 130.h),
        _Name(friend: friend),
        _Calls(),
        SizedBox(height: 20.h),
        _Action(),
        _Notification(),
        _Action(),
        SizedBox(height: 150.h),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  final FriendModel friend;
  const _Name({required this.friend});

  @override
  Widget build(BuildContext context) {
    var name = friend.username;
    return CustomText(text: name, size: 30.sp, type: Type.overMedium);
  }
}

class _Calls extends StatelessWidget {
  const _Calls();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _CallsIcon(icon: Icons.call, text: "Call", onTap: () {}),
        ),
        Expanded(
          child: _CallsIcon(
            icon: Icons.videocam,
            text: "Video Call",
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _CallsIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const _CallsIcon({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 0),
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24.sp),
            SizedBox(height: 4.h),
            CustomText(text: text, size: 15.sp, type: Type.overMedium),
          ],
        ),
      ),
    );
  }
}

class _Notification extends StatelessWidget {
  const _Notification();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4.h),
      leading: Icon(Icons.notifications, size: 30.sp),
      title: CustomText(
        text: "Mute Notifications",
        size: 19.sp,
        type: Type.overMedium,
      ),
      subtitle: CustomText(
        text: "Mute this chat for a period of time",
        size: 14.sp,
        opacity: FontOpacity.medium,
      ),
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch(
          padding: EdgeInsets.zero,
          value: true,
          onChanged: (value) {},
          activeTrackColor: const Color(0xFF25D366),
          activeColor: Colors.white,
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const _Action();

  @override
  Widget build(BuildContext context) {
    var color = Colors.redAccent;
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: color, width: 1.r),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 5.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          _ActionItem(
            icon: Icons.delete,
            title: "Clear Chat",
            subTitle: "Delete all messages",
            color: color,
            onTap: () {},
          ),
          Divider(color: color, height: 1.h),
          _ActionItem(
            icon: Icons.person_remove,
            title: "Unfriend",
            subTitle: "Remove this friend from your list",
            color: color,
            onTap: () {},
          ),
          Divider(color: color, height: 1.h),
          _ActionItem(
            icon: Icons.block,
            title: "Block Friend",
            subTitle: "Block this friend to stop all interactions",
            color: color,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color;
  final VoidCallback onTap;
  const _ActionItem({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      minVerticalPadding: 0,
      visualDensity: VisualDensity(vertical: -4.h),
      leading: Icon(icon, size: 30.sp, color: color),
      title: CustomText(
        text: title,
        size: 19.sp,
        type: Type.overMedium,
        color: color,
      ),
      subtitle: CustomText(text: subTitle, size: 14.sp, color: color),
      trailing: Icon(Icons.arrow_forward_ios, size: 24.sp, color: color),
    );
  }
}
