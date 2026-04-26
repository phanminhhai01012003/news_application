import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_application/core/convert.dart';
import 'package:news_application/presentation/views/main/settings/selection.dart';
import 'package:news_application/presentation/views/main/setup/change_state_widget.dart';
import 'package:news_application/state/setup_state.dart';
import 'package:provider/provider.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor,
          foregroundColor: theme.appBarTheme.foregroundColor,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                size: 20,
              )
            ),
          ),
          title: Text(
            "Cài đặt",
            style: TextStyle(
              fontSize: getTitleFontSize(context),
              fontWeight: FontWeight.w700
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<SetupState>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Selection(
                    icon: Icons.info, 
                    title: "Giới thiệu", 
                    onTap: (){}
                  ),
                  Selection(
                    icon: Icons.rule, 
                    title: "Điều khoản sử dụng", 
                    onTap: (){}
                  ),
                  Selection(
                    icon: Icons.privacy_tip, 
                    title: "Quyền riêng tư", 
                    onTap: (){}
                  ),
                  Selection(
                    icon: Icons.question_answer, 
                    title: "Hỗ trợ", 
                    onTap: (){}
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.colorScheme.onSecondary)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Giao diện",
                          style: TextStyle(
                            color: theme.colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChangeStateWidget(
                              onChanged: () => value.systemTheme, 
                              change: value.isSystem,
                              title: "Hệ thống",
                            ),
                            ChangeStateWidget(
                              onChanged: () => value.lightTheme, 
                              change: value.isLight,
                              title: "Sáng",
                            ),
                            ChangeStateWidget(
                              onChanged: () => value.darkTheme, 
                              change: value.isDark,
                              title: "Tối",
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.colorScheme.onSecondary)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cỡ chữ",
                          style: TextStyle(
                            color: theme.colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChangeStateWidget(
                              onChanged: () => value.smallFont, 
                              change: value.isSmallFontSize,
                              title: "Nhỏ",
                            ),
                            ChangeStateWidget(
                              onChanged: () => value.defaultFont, 
                              change: value.isDefaultFontSize,
                              title: "Mặc định",
                            ),
                            ChangeStateWidget(
                              onChanged: () => value.bigFont, 
                              change: value.isLargeFontSize,
                              title: "Lớn",
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
      ),
    );
  }
}