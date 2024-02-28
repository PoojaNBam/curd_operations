import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';


class Common {
  Common._();



  static Future<bool> isNetworkConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }


  static showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }











}
