import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color buttonColor;
  final VoidCallback onPressed;
  final Widget child;
  const Button({
    super.key, 
    required this.width,
    required this.height,
    required this.radius,
    required this.buttonColor, 
    required this.onPressed,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))
        ),
        onPressed: onPressed, 
        child: child
      ),
    );
  }
}