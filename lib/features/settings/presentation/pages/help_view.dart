import '../widgets/help_body.dart';
import '../../../../generated/l10n.dart';
import '../widgets/settings_top.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_background.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
        return BackGround(
      top: SettingsTop(title: S.of(context).policyTitle),
      body:  SingleChildScrollView(child: HelpBody()),
    );
  
  }
}
