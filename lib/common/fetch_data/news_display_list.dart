import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/news_model.dart';

class NewsDisplayList extends StatefulWidget {
  final NewsModel news;
  const NewsDisplayList({super.key, required this.news});

  @override
  State<NewsDisplayList> createState() => _NewsDisplayListState();
}

class _NewsDisplayListState extends State<NewsDisplayList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        tileColor: AppColors.white,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            widget.news.file.first,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null 
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! 
                        : null,
                      color: AppColors.blue,
                    ),
                  );          
                },
            errorBuilder: (context, error, stackTrace) => Image.asset(logo),
              ),
            ),
            title: Expanded(
              child: Text(
                widget.news.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16
                ),
              ),
            ),
            subtitle: Expanded(
              child: Text(
                widget.news.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14
                ),
              ),
            ),
          ),
      );
  }
}