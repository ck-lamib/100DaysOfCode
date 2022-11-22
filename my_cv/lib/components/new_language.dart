import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

Widget ntext(String value) => Text(
      value,
      style: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: Colorss().textColor,
      ),
    );

//for technical skills
List<String> languages = const [
  "Nepali(Native)",
  "English(Fluent)",
  "Hindi(Fluent)",
];

List<Widget> languageValues() {
  return languages.map<Widget>((language) => ntext(language)).toList();
}

//