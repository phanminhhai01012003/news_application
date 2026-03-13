import 'package:flutter/material.dart';
import 'package:news_application/common/dialog/loading_dialog.dart';
import 'package:news_application/common/other/animate_navigation.dart';
import 'package:news_application/common/other/button.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/presentation/controllers/authentication/on_auth.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isObsured = true;
  bool isLoading = false;
  bool showError = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool get check => _emailController.text.isEmpty || _passwordController.text.isEmpty;
  void firstState() {
    setState(() {
      isLoading = true;
    });
  }
  void lastState() {
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (isLoading) {
      loadingDialog(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _emailController,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Nhập email",
              hintStyle: TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(33),
                borderSide: BorderSide(color: AppColors.black)
              ),
              prefixIcon: Icon(
                Icons.email, 
                size: 20,
                color: AppColors.grey,
              )
            ),
          ),      
          SizedBox(height: 20),
          Text(
            "Mật khẩu",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            obscureText: isObsured,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Nhập mật khẩu",
              hintStyle: TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(33),
                borderSide: BorderSide(color: AppColors.black)
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: AppColors.grey, 
                size: 20
              ),
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    isObsured = !isObsured;
                  });
                }, 
                icon: Icon(
                  isObsured ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                )
              )
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.push(
                context, 
                AnimateNavigation(child: forgotPassword, begin: Offset(0, 1))),
              child: Text(
                "Quên mật khẩu",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12
                ),
              )
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: showError,
            child: Text(
              "Vui lòng điền đầy đủ thông tin",
              style: TextStyle(
                color: AppColors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 20),
          Button(
            width: double.infinity, 
            height: 50, 
            radius: 33, 
            buttonColor: isLoading ? AppColors.blue.withOpacity(0.5) : AppColors.blue, 
            onPressed: () {
              if (check) {
                setState(() {
                  showError = true;
                });
              }
              OnAuth.onSignInWithAccount(
                context, 
                firstState: firstState,
                lastState: lastState,
                email: _emailController.text, 
                password: _passwordController.text
              );
            }, 
            child: Text(
              isLoading ? "Đang tải" : "Đăng nhập",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),
            )
          )
        ],
      ),
    );
  }
}