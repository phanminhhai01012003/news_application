import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_application/common/dialog/loading_dialog.dart';
import 'package:news_application/common/modal_sheet/file_picker.dart';
import 'package:news_application/common/other/button.dart';
import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/core/convert.dart';
import 'package:news_application/model/news_model.dart';
import 'package:news_application/presentation/controllers/crud_news/on_set_news.dart';
import 'package:news_application/services/image_services.dart';

class AddEditItem extends StatefulWidget {
  final NewsModel? news;
  const AddEditItem({super.key, required this.news});

  @override
  State<AddEditItem> createState() => _AddEditItemState();
}

class _AddEditItemState extends State<AddEditItem> {
  List<File> files = [];
  List<String> filesUrlList = [];
  String? selectedCategory;
  final titleController = TextEditingController();
  final summaryController = TextEditingController();
  final detailController = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.news != null) {
      filesUrlList = widget.news!.file;
      titleController.text = widget.news!.title;
      selectedCategory = widget.news!.tag;
      summaryController.text = widget.news!.summary;
      detailController.text = widget.news!.details;
    }
    if (isLoading) {
      loadingDialog(context);
    }
  }
  void onNews() async{
    setState(() {
      isLoading = true;
    });
    if (files.isNotEmpty){
      final filesUrl = await ImageServices.uploadFileToStorage(files);
      if (filesUrl != null) {
        filesUrlList.add(filesUrl);
      }
    }
    NewsModel newsModel = NewsModel(
      newsId: widget.news == null ? generateRandomString(25) : widget.news!.newsId, 
      file: filesUrlList, 
      title: titleController.text, 
      tag: selectedCategory!, 
      summary: summaryController.text, 
      userId: widget.news == null ? supabase.auth.currentUser!.id : widget.news!.userId, 
      details: detailController.text, 
      createdAt: widget.news == null ? DateTime.now() : widget.news!.createdAt,
      views: widget.news == null ? 0 : widget.news!.views,
      likes: widget.news == null ? [] : widget.news!.likes 
    );
    setState(() {
      isLoading = false;
    });
    if (widget.news == null) {
      OnSetNews.addNewsController(newsModel);
      ShowResultMessage.showToastMessage("Thêm thành công", AppColors.green);
    } else {
      OnSetNews.updateNewsController(newsModel);
      ShowResultMessage.showToastMessage("Cập nhật thành công", AppColors.green);
    }
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor,
          foregroundColor: theme.appBarTheme.foregroundColor,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.all(4),
            child: IconButton(
              onPressed: (){},
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          ),
          title: Text(
            widget.news == null ? "Thêm bài báo mới" : "Chỉnh sửa bài báo",
            style: TextStyle(
              fontSize: getTitleFontSize(context),
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              files.isEmpty || filesUrlList.isEmpty ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: theme.colorScheme.onSecondary)
                ),
                child: Center(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 20,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ) : files.isNotEmpty ? Expanded(
                child: Row(
                  children: List.generate(files.length, (i) => Stack(
                    children: [
                      Image.file(
                        files[i],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Visibility(
                          visible: i != 0,
                          child: GestureDetector(
                            onTap: () {
                              files.removeAt(i);
                              setState(() {});
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]
                  )),
                ),
              ) : Expanded(
                child: Row(
                  children: List.generate(filesUrlList.length, (i) => Stack(
                    children: [
                      Image.network(
                        filesUrlList[i],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Visibility(
                          visible: i != 0,
                          child: GestureDetector(
                            onTap: () {
                              filesUrlList.removeAt(i);
                              setState(() {});
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]
                  )),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Button(
                  width: MediaQuery.of(context).size.width * 0.3, 
                  height: 30, 
                  radius: 33, 
                  buttonColor: AppColors.yellow, 
                  onPressed: () async{
                    final media = await showFilePickerModal(context);
                    if (media != null) {
                      files.add(media);
                    }
                  }, 
                  child: Text(
                    "Thêm ảnh/video",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                    ),
                  )
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Tiêu đề",
                style: TextStyle(
                  fontSize: getTitleFontSize(context),
                  color: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: titleController,
                cursorColor: AppColors.blue,
                style: TextStyle(
                  color: theme.colorScheme.onSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.normal
                ),
                maxLength: 1000,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Nhập tiêu đề",
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: theme.colorScheme.onSecondary)
                  )
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Thể loại",
                style: TextStyle(
                  fontSize: getTitleFontSize(context),
                  color: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colorScheme.onSecondary)
              ),
              child: DropdownButton(
                underline: SizedBox(),
                isExpanded: true,
                hint: Text("Chọn",
                  style: TextStyle(
                    color: theme.colorScheme.onSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  ),
                ),
                items: categories.map((String item){
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item,
                      style: TextStyle(
                        color: theme.colorScheme.onSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  value: selectedCategory,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 20,
                  style: TextStyle(color: theme.colorScheme.onSecondary),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Tóm tắt tin",
                style: TextStyle(
                  fontSize: getTitleFontSize(context),
                  color: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: summaryController,
                cursorColor: AppColors.blue,
                style: TextStyle(
                  color: theme.colorScheme.onSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.normal
                ),
                maxLength: 5000,
                minLines: 5,
                maxLines: 5,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Ghi khái quát thông tin (ngắn gọn)",
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: theme.colorScheme.onSecondary)
                  )
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Chi tiết",
                style: TextStyle(
                  fontSize: getTitleFontSize(context),
                  color: theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: detailController,
                cursorColor: AppColors.blue,
                style: TextStyle(
                  color: theme.colorScheme.onSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.normal
                ),
                minLines: 10,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Ghi rõ thông tin chi tiết",
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: theme.colorScheme.onSecondary)
                  )
                ),
              ),
              SizedBox(height: 30),
              Button(
                width: MediaQuery.of(context).size.width, 
                height: 50, 
                radius: 33, 
                buttonColor: AppColors.yellow, 
                onPressed: onNews, 
                child: Text(
                  widget.news == null ? "Đăng" : "Cập nhật",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}