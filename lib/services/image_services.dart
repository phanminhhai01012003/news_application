import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageServices {
  static Future<File?> pickImage(bool isCamera) async{
    try {
      final picker = ImagePicker();
      final imagePicker = await picker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
      if (imagePicker == null) return null;
      return File(imagePicker.path);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  static Future<File?> pickVideo(bool isVideoRecord) async{
    try {
      final picker = ImagePicker();
      final videoPicker = await picker.pickVideo(source: isVideoRecord ? ImageSource.camera : ImageSource.gallery);
      if (videoPicker == null) return null;
      return File(videoPicker.path);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  static Future<String?> uploadFileToStorage(List<File> files) async{
    try {
      for (var file in files){
        final uploadImage = await supabase.storage.from("news_files").upload(
          file.path, 
          file, 
          fileOptions: FileOptions(
            cacheControl: '3600',
            contentType: ""
          )
        );
        return supabase.storage.from("news_files").getPublicUrl(uploadImage);
      }
      return null;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}