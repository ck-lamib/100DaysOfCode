import 'package:flutter/material.dart';
import 'package:todo_bloc/presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
