import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/core/app_themes.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/state/news_state.dart';
import 'package:news_application/state/setup_state.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsState()),
        ChangeNotifierProvider(create: (context) => SetupState())
      ],
      child: Consumer<SetupState>(
        builder: (context, value, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter News App',
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: value.theme,
              home: splash,
            ),
          );
        },
      )
    );
  }
}