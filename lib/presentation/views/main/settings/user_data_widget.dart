import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_application/common/fetch_data/fetch_user.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/user_model.dart';
import 'package:news_application/presentation/controllers/authentication/on_user.dart';

class UserDataWidget extends StatefulWidget {
  const UserDataWidget({super.key});

  @override
  State<UserDataWidget> createState() => _UserDataWidgetState();
}

class _UserDataWidgetState extends State<UserDataWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OnUser.onGetUser(supabase.auth.currentUser!.id), 
      builder: (context, snapshot){
        if (!snapshot.hasData || snapshot.hasError) {
          return SizedBox.shrink();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return SpinKitCircle(
            size: 50,
            color: AppColors.grey,
          );
        } else {
          List<UserModel> data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => FetchUser(user: data[index]),
          );
        }
      }
    );
  }
}