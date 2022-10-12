import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  const Count({super.key, required this.count, this.onCountSelected});
  final int count;
  final VoidCallback? onCountSelected;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onCountSelected, child: Text("$count"));
  }
}
