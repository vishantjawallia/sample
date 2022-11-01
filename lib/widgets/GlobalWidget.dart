import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalWidget {
  static toast(String? value) {
    return Fluttertoast.showToast(
      msg: "$value",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade700,
      textColor: Colors.white,
    );
  }
}
