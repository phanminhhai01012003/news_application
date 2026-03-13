import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:news_application/state/setup_state.dart';
import 'package:provider/provider.dart';

String generateRandomString(int length){
  final rand = Random();
  const availableChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  return String.fromCharCodes(Iterable.generate(length, (_) => availableChars.codeUnitAt(rand.nextInt(availableChars.length))));
}

String get timeInDate {
  int hour = DateTime.now().hour;
  if (hour < 12) {
    return "buổi sáng";
  } else if (hour < 18) {
    return "buổi chiều";
  }
  return "buổi tối";
}

double getTitleFontSize(BuildContext context) {
  final setup = Provider.of<SetupState>(context);
  if (setup.isSmallFontSize) {
    return 16;
  } else if (setup.isDefaultFontSize) {
    return 20;
  }
  return 24; 
}

double getSummaryFontSize(BuildContext context) {
  final setup = Provider.of<SetupState>(context);
  if (setup.isSmallFontSize) {
    return 12;
  } else if (setup.isDefaultFontSize){
    return 16;
  }
  return 20;
}

double getDetailsFontSize(BuildContext context) {
  final setup = Provider.of<SetupState>(context);
  if (setup.isSmallFontSize) {
    return 8;
  } else if (setup.isDefaultFontSize){
    return 12;
  }
  return 16;
}