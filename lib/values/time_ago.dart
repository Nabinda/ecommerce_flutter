import 'package:cloud_firestore/cloud_firestore.dart';

class TimeAgo {
  String uploadTimeAgo(Timestamp ts) {
    DateTime dt = ts.toDate();
    Duration difference = DateTime.now().difference(dt);
    if ((difference.inDays / 365).floor() >= 1) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}