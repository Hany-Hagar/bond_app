import 'package:intl/intl.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';


class CustomFormatDate {

    static String item({required DateTime time , required BuildContext context}) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final check = DateTime(time.year, time.month, time.day - 1);
    if (check == today) {
      return DateFormat("h:mm a").format(check);
    } else if (check == yesterday) {
      return S.of(context).yesterday;
    } else {
      return DateFormat("dd/MM/yyy").format(check);
    }
  }

      static String grouped({required DateTime time , required BuildContext context}) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final check = DateTime(time.year, time.month, time.day - 1);
    if (check == today) {
      return S.of(context).today;
    } else if (check == yesterday) {
      return S.of(context).yesterday;
    } else {
      return DateFormat("dd/MM/yyy").format(check);
    }
  }
}







