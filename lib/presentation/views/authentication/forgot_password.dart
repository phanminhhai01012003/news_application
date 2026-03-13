import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_application/common/other/button.dart';
import 'package:news_application/core/app_colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String selectedOption = "Email";
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new, 
                size: 20
              )
            ),
          ),
          title: Text(
            "Quên mật khẩu",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile<String>(
                title: Text("Email"),
                value: "Email", 
                groupValue: selectedOption, 
                onChanged: (value){
                  setState(() {
                    selectedOption = value!;
                  });
                }
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                enabled: selectedOption == "Email",
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
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
              RadioListTile<String>(
                title: Text("Số điện thoại"),
                value: "Số điện thoại", 
                groupValue: selectedOption, 
                onChanged: (value){
                  setState(() {
                    selectedOption = value!;
                  });
                }
              ),
              SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                enabled: selectedOption == "Số điện thoại",
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
                decoration: InputDecoration(
                  hintText: "Nhập số điện thoại",
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
                    Icons.phone, 
                    size: 20,
                    color: AppColors.grey,
                  )
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Button(
                  width: MediaQuery.of(context).size.width / 2, 
                  height: 50, 
                  radius: 33, 
                  buttonColor: AppColors.blue, 
                  onPressed: (){}, 
                  child: Text(
                    "Xác nhận",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}