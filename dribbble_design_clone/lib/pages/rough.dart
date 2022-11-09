import 'package:flutter/material.dart';

class RoughClass extends StatelessWidget {
  const RoughClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Center(child: Text("this is rough adasdpage")),
      )),
    );
  }
}
