import '../../../generated/l10n.dart';
import '../widgets/friends_body.dart';
import 'package:flutter/material.dart';
import '../../settings/presentation/widgets/settings_top.dart';
import '../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      top: SettingsTop(title: S.current.friends),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FriendsBody(),
      ),
    );
  }
}