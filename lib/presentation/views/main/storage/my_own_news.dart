import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_application/common/other/animate_navigation.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/presentation/views/main/news/add_edit_item.dart';

class MyOwnNews extends StatefulWidget {
  const MyOwnNews({super.key});

  @override
  State<MyOwnNews> createState() => _MyOwnNewsState();
}

class _MyOwnNewsState extends State<MyOwnNews> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        title: Text(
          "Bài báo của bạn",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(4),
          child: IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              size: 20,
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        shape: CircleBorder(),
        onPressed: (){
          Navigator.push(
            context,
            AnimateNavigation(
              child: AddEditItem(news: null), 
              begin: Offset(0, 1)
            )
          );
        },
        child: Icon(Icons.add, size: 20),
      ),
    );
  }
}