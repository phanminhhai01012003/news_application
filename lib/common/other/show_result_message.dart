import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_application/core/app_colors.dart';

class ShowResultMessage {
  static void showToastMessage(String title, Color color){
    Fluttertoast.showToast(
      msg: title,
      textColor: AppColors.white,
      backgroundColor: color,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16
    );
  }
}