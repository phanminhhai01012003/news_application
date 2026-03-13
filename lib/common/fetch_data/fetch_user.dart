import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/user_model.dart';

class FetchUser extends StatefulWidget {
  final UserModel user;
  const FetchUser({super.key, required this.user});

  @override
  State<FetchUser> createState() => _FetchUserState();
}

class _FetchUserState extends State<FetchUser> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.white,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                widget.user.avatar,
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
                errorBuilder: (context, error, stackTrace) => Image.asset(userDefaultImage),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.userName,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.user.email,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}