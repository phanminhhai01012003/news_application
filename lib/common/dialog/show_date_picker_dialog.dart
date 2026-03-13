import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';

Future<void> selectDOBAndroid(BuildContext context, void Function(DateTime) onDateChanged) async{
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900), 
    lastDate: DateTime.now(),
    helpText: "Chọn ngày sinh của bạn",
    cancelText: "Hủy",
    confirmText: "Chọn"
  );
  if (pickedDate != null){
    onDateChanged(pickedDate);
  }
}
Future<void> selectDOBIos(BuildContext context, void Function(DateTime) onDateTimeChanged) async {
  await showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    context: context,
    // ignore: deprecated_member_use
    barrierColor: AppColors.black.withOpacity(0.25),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.width / 3,
        color: AppColors.white,
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.date,
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          onDateTimeChanged: onDateTimeChanged
        ),
      );
    }
  );
}