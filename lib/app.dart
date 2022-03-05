import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'importer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.baseColor,
        ),
        scaffoldBackgroundColor: AppColors.baseColor,
      ),
      home: ScreenUtilInit(
        // デザイン原案におけるデバイス画面の大きさ(単位：dp)
        designSize: const Size(360, 690),
        builder: () => const Home(title: Strings.appTitle),
      ),
    );
  }
}
