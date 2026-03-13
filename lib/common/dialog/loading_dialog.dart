import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_application/core/app_colors.dart';

void loadingDialog(BuildContext context){
  showDialog(
    context: context,
    barrierColor: AppColors.black.withOpacity(0.25),
    builder: (context) => Dialog(
      insetAnimationCurve: Easing.legacy,
      insetAnimationDuration: Duration(milliseconds: 500),
      backgroundColor: AppColors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCircle(
            size: 20,
            color: AppColors.white,
          ),
          SizedBox(width: 5),
          Text(
            "Loading",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),
          )
        ],
      ),
    )
  );
}