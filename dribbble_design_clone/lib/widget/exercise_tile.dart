import 'package:dribbble_design_clone/pages/rough.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final IconData emoji;
  final String exerciseTitle;
  final int exerciseNum;
  final dynamic backColor;
  final dynamic routeTo;
  const ExerciseTile(
      {super.key,
      required this.emoji,
      required this.exerciseNum,
      required this.exerciseTitle,
      required this.backColor,
      required this.routeTo});

  void routet(BuildContext context, value) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext contex) => const RoughClass()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: backColor,
            child: Icon(
              emoji,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          exerciseTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "$exerciseNum Exercises",
        ),
        trailing: const Icon(Icons.more_vert),
        onTap: () => routet(context, routeTo),
      ),
    );
  }
}
