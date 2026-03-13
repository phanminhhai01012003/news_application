import 'package:supabase_flutter/supabase_flutter.dart';

//supabase
String supabaseUrl = "https://gwhrptqbsbebsolgdiio.supabase.co";
String supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd3aHJwdHFic2JlYnNvbGdkaWlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA1ODc0NzYsImV4cCI6MjA3NjE2MzQ3Nn0.JnSgoFtHVd6hbTxLx-JBD4Ulb_zcjVCak244qE5pGVY";
final supabase = Supabase.instance.client;

//image
String imagePath = "assets/images";
String logo = "$imagePath/tg.png";
String userDefaultImage = "$imagePath/user.png";

//list
List<String> roles = ["Phóng viên/Nhà báo", "Người dùng thông thường"];
List<String> categories = [
  "Kinh tế", 
  "Chính trị", 
  "Xã hội",
  "Khoa học",
  "Công nghệ",
  "Văn hóa",
  "Đời sống",
  "Thời trang",
  "Ẩm thực",
  "Thể thao",
  "Thời tiết",
  "Lĩnh vực khác"
];
List<String> slideImages = [
  "https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1493382051629-7eb03ec93ea2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
];

//table
String userTable = "user";
String newsTable = "news";
String saveTable = "save";
String recentTable = "recent";
String commentTable = "comment";
String tagTable = "tag";