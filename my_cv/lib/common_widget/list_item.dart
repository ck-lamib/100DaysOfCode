import 'package:flutter/material.dart';

class Itemss extends StatelessWidget {
  final List itemList;
  const Itemss({super.key, required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Text(
        itemList[index],
      ),
      // itemCount: itemList.length,
    );
  }
}
