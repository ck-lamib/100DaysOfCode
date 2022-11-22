import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

Divider horizontalline = Divider(
  thickness: 1,
  color: Colorss().lineColor,
);

VerticalDivider verticalline = VerticalDivider(
  thickness: 1,
  color: Colorss().lineColor,
);

SizedBox space(double height, {double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget profilepic = CircleAvatar(
  backgroundImage: AssetImage(
    Imagess().me,
  ),
  radius: 60.0,
);

Widget profileInfo = Expanded(
  child: Text(
    "Hi, my name is Bimal khatri. I'm a tech enthusiast and a passionate developer who likes to write code and experiment with new tech.I'm currently pursuing my Bachelor of Science in Computing with Honors at Informatics College Pokhara . I attended Nepal APF School for my secondary level education and Sagarmatha College Pokhara for grades 11 and 12. Beside tech field i like to travel, sketch, cycling and do photography.",
    style: TextStyle(fontSize: 19, color: Colorss().textColor),
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.justify,
    maxLines: 9,
  ),
);

Widget me = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15),
  child: Row(
    children: [
      profilepic,
      space(0, width: 20),
      profileInfo,
    ],
  ),
);
