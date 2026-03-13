import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/news_model.dart';

class NewsDisplayGrid extends StatefulWidget {
  final NewsModel news;
  const NewsDisplayGrid({super.key, required this.news});

  @override
  State<NewsDisplayGrid> createState() => _NewsDisplayGridState();
}

class _NewsDisplayGridState extends State<NewsDisplayGrid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Card(
        surfaceTintColor: AppColors.white,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.news.file.first,
                  height: 50,
                  width: double.infinity,
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
              SizedBox(height: 10),
              Expanded(
                child: Text(
                  widget.news.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: Text(
                  widget.news.summary,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
