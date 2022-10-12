import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  const Count({super.key, required this.count, this.onCountSelected, required this.counter});
  final int count;
  final VoidCallback? onCountSelected;
  final Function(int) counter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: (() {
              counter(1);
            }),
            icon: const Icon(Icons.add)),
        TextButton(onPressed: onCountSelected, child: Text("$count")),
        IconButton(
            onPressed: (() {
              counter(-1);
            }),
            icon: Icon(Icons.remove)),
      ],
    );
  }
}
