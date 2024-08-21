import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/strings.dart';

class TimeAgo {
  TimeAgo._();

  static String timeAgo(BuildContext context, DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 10) {
      return Strings.of(context).now;
    } else if (difference.inSeconds < 60) {
      return Strings.of(context).secondsAgo(difference.inSeconds);
    } else if (difference.inMinutes < 60) {
      return Strings.of(context).minutesAgo(difference.inMinutes);
    } else if (difference.inHours < 24) {
      return Strings.of(context).hoursAgo(difference.inHours);
    } else if (difference.inDays < 7) {
      return Strings.of(context).daysAgo(difference.inDays);
    } else {
      return DateFormat('dd.MM.yy').format(date);
    }
  }
}
