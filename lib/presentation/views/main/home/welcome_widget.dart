import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/core/convert.dart';
import 'package:news_application/model/user_model.dart';
import 'package:news_application/presentation/controllers/authentication/on_user.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OnUser.onGetUser(supabase.auth.currentUser!.id), 
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError){
          return SizedBox.shrink();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return SpinKitCircle(
            size: 20,
            color: AppColors.white,
          );
        } else {
          List<UserModel> data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    data[index].avatar,
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null 
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! 
                            : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Image.asset(userDefaultImage),
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chào mừng, ${data[index].userName}",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Chúc bạn 1 $timeInDate tốt lành!",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      },
    );
  }
}