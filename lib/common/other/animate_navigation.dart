import 'package:flutter/material.dart';

class AnimateNavigation extends PageRouteBuilder{
  final Widget child;
  final Offset begin;

  AnimateNavigation({required this.child, required this.begin})
  : super(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: begin,
            end: Offset.zero
          ).animate(animation),
          child: child,
        );
      },
    );
  
}