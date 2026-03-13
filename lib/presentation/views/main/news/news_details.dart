import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/core/convert.dart';
import 'package:news_application/model/news_model.dart';
import 'package:news_application/model/save_model.dart';
import 'package:news_application/state/news_state.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel news;
  const NewsDetails({super.key, required this.news});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  bool isLiked = false;
  void toggleLikePost() {
    setState(() {
      isLiked = !isLiked;
    });
    if (isLiked){
      
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLiked = widget.news.likes.any((likes) => likes['id'] == supabase.auth.currentUser!.id);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SaveModel save = SaveModel(
      saveId: generateRandomString(23), 
      userId: supabase.auth.currentUser!.id, 
      newsId: widget.news.newsId
    );
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onPrimary,
        foregroundColor: theme.colorScheme.onSecondary,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              size: 20,
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              hitTestBehavior: HitTestBehavior.translucent,
              clipBehavior: Clip.hardEdge,
              physics: ClampingScrollPhysics(),
              itemCount: widget.news.file.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.news.file[index])
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.news.title,
              style: TextStyle(
                color: theme.colorScheme.onSecondary,
                fontSize: getTitleFontSize(context),
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Thể loại: ${widget.news.tag}",
              style: TextStyle(
                color: theme.colorScheme.onSecondary,
                fontSize: getSummaryFontSize(context),
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.news.summary,
              style: TextStyle(
                color: theme.colorScheme.onSecondary,
                fontSize: getSummaryFontSize(context),
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.news.details,
              style: TextStyle(
                color: theme.colorScheme.onSecondary,
                fontSize: getDetailsFontSize(context),
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: toggleLikePost, 
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? AppColors.red : AppColors.grey,
                        size: 20,
                      )
                    ),
                    Text(
                      widget.news.likes.length.toString(),
                      style: TextStyle(
                        color: theme.colorScheme.onSecondary,
                        fontSize: getDetailsFontSize(context),
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(
                    Icons.share,
                    color: AppColors.grey,
                    size: 20,
                  )
                ),
                IconButton(
                  onPressed: () => context.read<NewsState>().toggleSaveData(save), 
                  icon: Icon(
                    context.read<NewsState>().isSaved(save) ? Icons.bookmark : Icons.bookmark_border,
                    color: context.read<NewsState>().isSaved(save) ? AppColors.yellow : AppColors.grey,
                    size: 20,
                  )
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}