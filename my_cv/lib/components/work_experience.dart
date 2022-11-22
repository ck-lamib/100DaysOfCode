import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

class WorkExperience extends StatelessWidget {
  final String title;
  final String date;
  final String companyName;
  final String location;
  final String desc;
  const WorkExperience(
      {super.key,
      required this.title,
      required this.companyName,
      required this.location,
      required this.date,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: Colorss().headingtextColor),
            ),
            Text(
              "$companyName - $location | $location",
              style: TextStyle(
                color: Colorss().sideColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                maxLines: 9,
                desc,
                style: TextStyle(fontSize: 17, color: Colorss().textColor),
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
