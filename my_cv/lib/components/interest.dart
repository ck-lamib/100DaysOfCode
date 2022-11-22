import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

Widget ntext(String value) => Text(
      value,
      style: TextStyle(
        height: 1.5,
        fontSize: 15,
        color: Colorss().textColor,
      ),
    );

//for technical skills
List<String> interests = const [
  "Sketching",
  "Sports",
  "Learning New Technology",
];

List<Widget> interestValues() {
  return interests.map<Widget>((interest) => ntext(interest)).toList();
}

//