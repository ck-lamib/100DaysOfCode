import 'package:day2/count.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int value = 0;
  void _increment(int incommingValue) {
    setState(() {
      value += incommingValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Count(
        counter: _increment,
        count: value,
        onCountSelected: () => debugPrint("The counter value is selected."),
      ),
    );
  }
}
