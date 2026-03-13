import 'package:flutter/material.dart';
import 'package:news_application/common/other/animate_navigation.dart';
import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/user_model.dart';
import 'package:news_application/presentation/views/main/settings/selection.dart';
import 'package:news_application/presentation/views/main/settings/user_data_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              UserDataWidget(),
              SizedBox(height: 10),
              Divider(height: 1, thickness: 1, color: AppColors.grey),
              SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                clipBehavior: Clip.hardEdge,
                hitTestBehavior: HitTestBehavior.translucent,
                children: [
                  Selection(
                    icon: Icons.newspaper, 
                    title: "Bài báo của tôi", 
                    onTap: () async{
                      final userDoc = await supabase
                        .from(userTable)
                        .select()
                        .eq('userId', supabase.auth.currentUser!.id)
                        .then((value) => value.map((e) => UserModel.fromMap(e)).toList());
                      if (userDoc.any((element) => element.role == roles.last)){
                        ShowResultMessage.showToastMessage("Chỉ dùng cho phóng viên/nhà báo", AppColors.red);
                        return;
                      } else {
                        Navigator.push(
                          context, 
                          AnimateNavigation(
                            child: myNews, 
                            begin: Offset(0, 1)
                          )
                        );
                      }
                    }
                  ),
                  Selection(
                    icon: Icons.bookmark, 
                    title: "Bài báo đã lưu", 
                    onTap: (){
                      Navigator.push(
                        context, 
                        AnimateNavigation(
                          child: saveNews, 
                          begin: Offset(0, 1)
                        )
                      );
                    }
                  ),
                  Selection(
                    icon: Icons.history, 
                    title: "Gần đây đã xem", 
                    onTap: (){
                      Navigator.push(
                        context, 
                        AnimateNavigation(
                          child: recentView, 
                          begin: Offset(0, 1)
                        )
                      );
                    }
                  ),
                  Selection(
                    icon: Icons.settings, 
                    title: "Cài đặt", 
                    onTap: (){
                      Navigator.push(
                        context, 
                        AnimateNavigation(
                          child: setup, 
                          begin: Offset(0, 1)
                        )
                      );
                    }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}