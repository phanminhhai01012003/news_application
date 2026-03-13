import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_application/common/other/button.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/services/image_services.dart';

Future<File?> showFilePickerModal(BuildContext context) async{
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true, 
    builder: (context) => FilePicker()
  );
}

class FilePicker extends StatefulWidget {
  const FilePicker({super.key});

  @override
  State<FilePicker> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePicker> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(bottom: 15, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: theme.colorScheme.onPrimary
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 5,
            margin: const EdgeInsets.only(bottom: 16, top: 10),
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: AppColors.grey
            ),
          ),
          Button(
            width: MediaQuery.of(context).size.width * 0.75, 
            height: 50, 
            radius: 33, 
            buttonColor: AppColors.blue, 
            onPressed: () async{
              final filePicked = await ImageServices.pickImage(true);
              if (filePicked != null) {
                Navigator.pop(context, filePicked);
              }
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_enhance, size: 20),
                SizedBox(width: 5),
                Text(
                  "Chụp ảnh",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  ),
                )
              ],
            )
          ),
          Button(
            width: MediaQuery.of(context).size.width * 0.75, 
            height: 50, 
            radius: 33, 
            buttonColor: AppColors.blue, 
            onPressed: () async{
              final filePicked = await ImageServices.pickVideo(true);
              if (filePicked != null) {
                Navigator.pop(context, filePicked);
              }
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_enhance, size: 20),
                SizedBox(width: 5),
                Text(
                  "Quay video",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  ),
                )
              ],
            )
          ),
          SizedBox(height: 20),
          Button(
            width: MediaQuery.of(context).size.width * 0.75, 
            height: 50, 
            radius: 33, 
            buttonColor: AppColors.blue, 
            onPressed: () async{
              final filePicked = await ImageServices.pickImage(false);
              if (filePicked != null) {
                Navigator.pop(context, filePicked);
              }
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_upload, size: 20),
                SizedBox(width: 5),
                Text(
                  "Chọn ảnh",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  ),
                )
              ],
            )
          ),
          Button(
            width: MediaQuery.of(context).size.width * 0.75, 
            height: 50, 
            radius: 33, 
            buttonColor: AppColors.blue, 
            onPressed: () async{
              final filePicked = await ImageServices.pickVideo(false);
              if (filePicked != null) {
                Navigator.pop(context, filePicked);
              }
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_upload, size: 20),
                SizedBox(width: 5),
                Text(
                  "Chọn video",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}