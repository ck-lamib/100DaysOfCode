import 'package:flutter/material.dart';

typedef Alias = Function(int);

class Count extends StatelessWidget {
  const Count({super.key, required this.count, this.onCountSelected, required this.counter});
  final int count;
  final VoidCallback? onCountSelected;
  final Alias counter;
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
            icon: const Icon(Icons.remove)),
      ],
    );
  }
}
