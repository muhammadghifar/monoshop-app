import 'package:flutter/material.dart';
import 'package:submission/view/main_screen.dart';
import 'package:submission/view/splash_screen.dart';
// import 'package:submission/view/product/detail_screen.dart';
import 'package:submission/utils/color.dart';

void main() {
  runApp(const MyApp());
  // runApp(MaterialApp(routes: {
  //   '/': (context) => const HomePage(title: 'this',),
  //   '/asd': (context) => const HomePage(title: 'Flutters'),
  // }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This.',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColors.defaultBackground,
        appBarTheme: const AppBarTheme(
          // backgroundColor: AppColors.defaultBackground, // Set AppBar background
          titleTextStyle: TextStyle(color: AppColors.contentBackground), // Set title color
        ),
        // You can add more theme configurations here
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
