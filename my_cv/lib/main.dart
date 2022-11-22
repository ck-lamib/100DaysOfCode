import 'package:flutter/material.dart';
import 'package:my_cv/model/main_page.dart';
import 'package:my_cv/util/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colorss().backgroundColor,
      ),
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15),
          child: const SingleChildScrollView(child: MainPage()),
        ),
      ),
    );
  }
}
