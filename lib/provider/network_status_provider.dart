import 'dart:io';

import 'package:flutter/material.dart';

class NetworkStatusProvider extends ChangeNotifier {
  Future<bool> checkConnection() async {
    bool status = false;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        status = true;
      }
    } on SocketException catch (_) {
      status = false;
    }
    return status;
  }
}
