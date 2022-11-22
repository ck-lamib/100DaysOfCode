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
List<String> technicalSkills = const [
  'Web development',
  'Front-End(React, Flutter)',
  "Back-End(Java,Python)",
  "Database(Sql)",
  "UI/UX(Adobe, Figma)",
  "Tools(Git,Linux)",
  "Testing(Cypress,JMeter)"
];

List<Widget> technicalValues() {
  return technicalSkills.map<Widget>((skill) => ntext(skill)).toList();
}

//for professional skills
List<String> professionalSkills = const [
  'Good Time Management',
  "Technical Ability",
  "Leadership and Team Work",
  "Effective Communication"
];
List<Widget> professionalValues() {
  return professionalSkills.map<Widget>((skill) => ntext(skill)).toList();
}
