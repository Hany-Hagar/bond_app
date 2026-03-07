import 'dart:developer';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text.dart';
import '../../settings/pages/settings_view.dart';
import '../../../core/utils/navigator_methods.dart';
import '../../../core/widgets/custom_app_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../profile/presentation/pages/views/profile_view.dart';

class LayoutTop extends StatelessWidget {
  const LayoutTop({super.key});

  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w, top: top, bottom: 6.h),
      child: Row(
        children: [
          CustomAppLogo(height: 60),
          Spacer(),
          GestureDetector(
            onTap: () => log('Notification'),
            child: Icon(
              Icons.notifications_none_outlined,
              color: Theme.of(context).hintColor,
              size: 40.sp,
            ),
          ),
          _MoreButton(),
        ],
      ),
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return PopupMenuButton<Widget>(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.5,
      ),

      icon: Icon(
        Icons.more_vert,
        color: Theme.of(context).hintColor,
        size: 40.sp,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      itemBuilder: (context) => [
        _moreItem(
          context: context,
          icon: Icons.group_add_outlined,
          text: 'New Group',
          value: SizedBox(),
        ),
        const PopupMenuDivider(),
        _moreItem(
          context: context,
          icon: Icons.settings_outlined,
          text: s.settings,
          value: SettingsView(),
        ),
        const PopupMenuDivider(),
        _moreItem(
          context: context,
          icon: Icons.person_outline,
          text: s.profile,
          value: ProfileView(),
        ),
      ],
      onSelected: (value) {
        NavTo.push(context: context, nextPage: value);
      },
    );
  }
}

PopupMenuItem<Widget> _moreItem({
  required BuildContext context,
  required IconData icon,
  required String text,
  required Widget value,
}) {
  return PopupMenuItem(
    height: 45.h,
    value: value,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Theme.of(context).hintColor, size: 25.sp),
        SizedBox(width: 10.w),
        CustomText(text: text, size: 20.sp),
      ],
    ),
  );
}
