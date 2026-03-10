import '../../../../core/services/url_service.dart';
import 'custom_card.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicyBody extends StatelessWidget {
  const PolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      children: [
        CustomCard(
          emoji: "🔒",
          title: s.policyTitle,
          content1: s.ploicyContent,
        ),
        CustomCard(
          emoji: "🧾",
          title: s.informationWeCollect,
          subtitle1: s.informationWeCollectSubTitle1,
          content1: s.informationWeCollectContent1,
          subtitle2: s.informationWeCollectSubTitle2,
          content2: s.informationWeCollectContent2,
        ),
        CustomCard(
          emoji: "🔐",
          title: s.howWeUseYourInformation,
          subtitle1: s.howWeUseYourInformationSubTitle,
          content1: s.howWeUseYourInformationContent,
        ),
        CustomCard(
          emoji: "🛡️",
          title: s.messagesAndEncryption,
          content1: s.messagesAndEncryptionContent,
        ),
        CustomCard(
          emoji: "📤",
          title: s.sharingYourInformation,
          subtitle1: s.sharingYourInformationSubTitle,
          content1: s.sharingYourInformationContent,
        ),
        CustomCard(
          emoji: "💾",
          title: s.dataStorageAndSecurity,
          subtitle1: s.dataStorageAndSecuritySubTitle1,
          content1: s.dataStorageAndSecurityContent,
          subtitle2: s.dataStorageAndSecuritySubTitle2,
        ),
        CustomCard(
          emoji: "👥",
          title: s.yourRights,
          subtitle1: s.yourRightsSubTitle,
          content1: s.yourRightsContent,
        ),
        CustomCard(
          emoji: "📱",
          title: s.changesToThisPolicy,
          content1: s.changesToThisPolicyContent,
        ),
        CustomCard(
          emoji: "📱",
          title: s.contactUs,
          content1: s.contactUsContent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity,),
              GestureDetector(
                onTap: () {
                  UrlService().openUrl("https://ibond.ai/");
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: CustomText(
                    text: '"https://ibond.ai/"',
                    size: 22.sp,
                    color: Theme.of(context).highlightColor,
                  )
                ),
              ),
               CustomText(
                  text: s.contactLastUpdated,
                  size: 16.sp,
                  maxLines: 10,
                ),
            ],
          ),
        ),
        SizedBox(height: 20.h)
      ],
    );
  }
}
