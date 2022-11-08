import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
