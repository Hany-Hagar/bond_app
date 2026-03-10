import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<void> openGmail() async {
    late Uri uri;

    if (Platform.isAndroid) {
      uri = Uri.parse('android-app://com.google.android.gm');
    } else if (Platform.isIOS) {
      uri = Uri.parse('googlegmail://');
    } else {
      uri = Uri.parse('https://mail.google.com/');
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(
        Uri.parse('https://mail.google.com/'),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> openVideo(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

}
