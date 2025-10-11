import 'package:flutter/material.dart';
import 'package:hello_trip/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Trip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF10487b)),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF10487b),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
