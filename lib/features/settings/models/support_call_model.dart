import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class SupportCallModel {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;
  final String url;

  SupportCallModel({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.url,
  });
}

List<SupportCallModel> supportCalls({required BuildContext context}) {
  final s = S.of(context);
  return [
    SupportCallModel(
      title: s.supportCallTitle,
      subTitle: s.supportCallSubTitle,
      icon: Icons.phone,
      iconColor: Colors.blue,
      url: "tel:+201022132452",
    ),
    SupportCallModel(
      title: s.supportWhatsappTitle,
      subTitle: s.supportWhatsappSubTitle,
      icon: Icons.chat,
      iconColor: Colors.green,
      url: "https://wa.me/+201022132452?text=مرحبا%20فريق%20الدعم%20",
    ),
    SupportCallModel(
      title: s.supportWebsiteTitle,
      subTitle: s.supportWebsiteSubTitle,
      icon: Icons.language,
      iconColor: Colors.red,
      url: "https://ibond.ai/",
    ),
  ];
}
