import 'package:flutter/material.dart';

class MoodIcons extends StatelessWidget {
  final String moodIcon;
  final String reaction;
  const MoodIcons({super.key, required this.moodIcon, required this.reaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(15),
          ),
          // child: const Icon(
          //   Icons.notifications,
          //   size: 30,
          //   color: Colors.white,
          // ),
          child: Text(
            moodIcon,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          reaction,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
