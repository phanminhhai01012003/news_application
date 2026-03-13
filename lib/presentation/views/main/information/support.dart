import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/convert.dart';
import 'package:news_application/model/support_model.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  bool isOpen = false;
  List<SupportModel> supports = [
    SupportModel(
      question: "", 
      answer: ""
    ),
    SupportModel(
      question: "", 
      answer: ""
    ),
    SupportModel(
      question: "", 
      answer: ""
    ),
    SupportModel(
      question: "", 
      answer: ""
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: supports.length,
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                surfaceTintColor: AppColors.grey,
                color: theme.colorScheme.onPrimary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Expanded(
                        child: Text(
                          supports[index].question,
                          style: TextStyle(
                            color: theme.colorScheme.onSecondary,
                            fontSize: getTitleFontSize(context),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      icon: Icon(
                        isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 20,
                        color: theme.colorScheme.onSecondary,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: isOpen,
                child: Text(
                  supports[index].answer,
                  style: TextStyle(
                    color: theme.colorScheme.onSecondary,
                    fontSize: getDetailsFontSize(context),
                    fontWeight: FontWeight.normal
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}