import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

class Education extends StatelessWidget {
  final String title;
  final String schoolName;
  final String date;
  const Education({super.key, required this.title, required this.schoolName, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              textDirection: TextDirection.ltr,
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 15,
                color: Colorss().sideColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          schoolName,
          style: TextStyle(
            color: Colorss().textColor,
            fontSize: 15,
          ),
        ),
        // SizedBox(
        //     height: 22,
        //     child: Text(
        //       date,
        //       style: const TextStyle(
        //         fontSize: 15,
        //       ),
        //     )),
      ],
    );
  }
}

// Widget educationDetails = 
