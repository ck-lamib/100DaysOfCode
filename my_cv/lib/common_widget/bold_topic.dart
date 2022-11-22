import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

Widget boldTopic(String value) => Row(
      children: [
        Container(
          height: 30,
          width: 18,
          color: Colorss().headingColor,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colorss().headingColor,
          ),
        ),
      ],
    );
