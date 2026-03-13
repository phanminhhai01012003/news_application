import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/convert.dart';

class ChangeStateWidget extends StatelessWidget {
  final VoidCallback onChanged;
  final bool change;
  final String title;
  const ChangeStateWidget({
    super.key,
    required this.onChanged,
    required this.change,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onChanged,
      child: Container(
        decoration: BoxDecoration(
          color: change ? AppColors.blue : theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12) 
        ),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.25,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: change ? AppColors.white : theme.colorScheme.onSecondary,
              fontSize: getTitleFontSize(context),
              fontWeight: change ? FontWeight.bold : FontWeight.normal
            ),
          ),
        ),
      ),
    );
  }
}