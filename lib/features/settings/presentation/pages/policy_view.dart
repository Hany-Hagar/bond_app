import '../widgets/policy_body.dart';
import '../../../../generated/l10n.dart';
import '../widgets/settings_top.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_background.dart';

class PolicyView extends StatelessWidget {
  const PolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      top: SettingsTop(title: S.of(context).policyTitle),
      body: const SingleChildScrollView(child: PolicyBody()),
    );
  }
}
