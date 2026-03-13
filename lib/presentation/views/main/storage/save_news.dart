import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_application/common/fetch_data/news_display_list.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/model/news_model.dart';
import 'package:news_application/model/save_model.dart';
import 'package:news_application/presentation/controllers/crud_news/on_get_news.dart';
import 'package:news_application/state/news_state.dart';
import 'package:provider/provider.dart';

class SaveNews extends StatefulWidget {
  const SaveNews({super.key});

  @override
  State<SaveNews> createState() => _SaveNewsState();
}

class _SaveNewsState extends State<SaveNews> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
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
        title: Text(
          "Đã lưu",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800
          ),
        ),
      ),
      body: Selector<NewsState, List<SaveModel>>(
        selector: (context, state) => state.saveProducts,
        builder: (context, value, child) {
          if (value.isEmpty) {
            return SizedBox.shrink();
          }
          return Column(
            children: List.generate(
              value.length, 
              (index) => FutureBuilder(
                future: OnGetNews.onGetNewsById(value[index].newsId), 
                builder: (context, snapshot){
                  if (!snapshot.hasData || snapshot.hasError) {
                    return SizedBox();
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: SpinKitCircle(size: 20, color: AppColors.yellow));
                  } else {
                    List<NewsModel> news = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      clipBehavior: Clip.hardEdge,
                      scrollDirection: Axis.vertical,
                      hitTestBehavior: HitTestBehavior.translucent,
                      itemCount: news.length,
                      itemBuilder: (context, index) => NewsDisplayList(news: news[index]),
                    );
                  }
                }
              )
            ),
          );
        },
      ),
    );
  }
}