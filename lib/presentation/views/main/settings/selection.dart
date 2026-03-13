import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/convert.dart';

class Selection extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  const Selection({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 20,
        color: AppColors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: theme.colorScheme.onSecondary,
          fontSize: getTitleFontSize(context),
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}