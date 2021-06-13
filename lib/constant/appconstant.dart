import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AppConstant {
  static void showSuccessToast(BuildContext context, String msg,
      {int duration, int gravity}) {
    Toast.show(msg, context, duration: 5, backgroundColor: Colors.green);
  }

  static void showFailToast(BuildContext context, String msg,
      {int duration, int gravity}) {
    Toast.show(msg, context, duration: 5, backgroundColor: Colors.red);
  }
}
