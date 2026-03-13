import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application/common/dialog/loading_dialog.dart';
import 'package:news_application/common/dialog/show_date_picker_dialog.dart';
import 'package:news_application/common/other/button.dart';
import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/presentation/controllers/authentication/on_auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState(){
    super.initState();
    if (isLoading) {
      loadingDialog(context);
    }
  }
  String? selectedRole;
  bool isObsured1 = true;
  bool isObsured2 = true;
  bool isLoading = false;
  bool showError = false;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool get check => 
    _nameController.text.isEmpty || 
    _phoneController.text.isEmpty || 
    _emailController.text.isEmpty ||
    selectedRole == "" || 
    _dateController.text.isEmpty ||
    _passwordController.text.isEmpty ||
    _confirmController.text.isEmpty;
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
  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || 
    (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Họ và tên",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _nameController,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Nhập tên của bạn",
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
              Icons.person_3,
              color: AppColors.grey, 
              size: 20
            )
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Ngày sinh",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _dateController,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),
          readOnly: true,
          onTap: () => Platform.isAndroid 
          ? selectDOBAndroid(
            context, 
            (value){
              setState(() {
                _dateController.text = DateFormat("dd/MM/yyyy").format(value);
              });
            }
          ) : selectDOBIos(
            context,
            (value) {
              setState(() {
                _dateController.text = DateFormat("dd/MM/yyyy").format(value);
              });
            }
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.calendar_month,
              size: 20,
              color: AppColors.grey,
            ),
            hintText: "dd/MM/yyyy",
            hintStyle: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(33),
              borderSide: BorderSide(color: AppColors.black)
            ),
    
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Điện thoại",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _phoneController,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),
          keyboardType: TextInputType.phone,
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
        SizedBox(height: 20),
        Text(
          "Vai trò",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField(
          value: selectedRole,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
            hintText: "Chọn vai trò",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(33),
              borderSide: BorderSide(color: AppColors.black)
            ),
            prefixIcon: Icon(
              Icons.settings,
              size: 20,
              color: AppColors.grey,
            ),
          ),
          items: roles.map((role){
            return DropdownMenuItem(
              value: role,
              child: Text(role),              
            );
          }).toList(), 
          onChanged: (value){
            setState(() {
              selectedRole = value;
            });
          }
        ),
        SizedBox(height: 20),
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
              color: AppColors.grey,
              size: 20
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
          obscureText: isObsured1,
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
                  isObsured1 = !isObsured1;
                });
              }, 
              icon: Icon(
                isObsured1 ? Icons.visibility : Icons.visibility_off,
                size: 20,
              )
            )
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Xác nhận lại mật khẩu",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _confirmController,
          obscureText: isObsured2,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Nhập lại mật khẩu",
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
                  isObsured2 = !isObsured2;
                });
              }, 
              icon: Icon(
                isObsured2 ? Icons.visibility : Icons.visibility_off,
                size: 20,
              )
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
          buttonColor: AppColors.blue, 
          onPressed: () {
            if (check) {
              setState(() {
                showError = true;
              });
            } else if (_confirmController.text != _passwordController.text) {
              ShowResultMessage.showToastMessage("Mật khẩu không trùng khớp", AppColors.red);
              return;
            } else if (selectedRole == "Phóng viên/Nhà báo") {
              if (calculateAge(DateTime.parse(_dateController.text)) < 16){
                ShowResultMessage.showToastMessage("Bạn phải đủ 16 tuổi trở lên mới đủ điều kiện", AppColors.red);
                return;
              }
            } else {
              OnAuth.onSignUp(
                context, 
                firstState: firstState, 
                lastState: lastState, 
                name: _nameController.text, 
                phone: _phoneController.text, 
                dateOfBirth: DateTime.tryParse(_dateController.text) ?? DateTime.now(), 
                role: selectedRole!, 
                email: _emailController.text, 
                password: _passwordController.text
              );
            }
          }, 
          child: Text(
            "Đăng ký",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal
            ),
          )
        )
      ],
    );
  }
}