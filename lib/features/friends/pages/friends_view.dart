import '../../../generated/l10n.dart';
import '../widgets/friends_body.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../../settings/presentation/widgets/settings_top.dart';
=======
import '../../settings/widgets/settings_top.dart';
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
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
