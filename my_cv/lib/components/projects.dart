import 'package:flutter/material.dart';
import 'package:my_cv/util/details.dart';

class Projects extends StatelessWidget {
  final String title;
  final String lang;
  final String gitLink;
  const Projects({super.key, required this.title, required this.lang, required this.gitLink});

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
              lang,
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
          gitLink,
          style: TextStyle(color: Colorss().textColor),
        ),
      ],
    );
  }
}

Widget projectDetails = Column(
  children: const [
    Projects(
      title: "College information system",
      lang: "Java    ",
      gitLink: "  -  https://github.com/Bimal-kc/College_Is",
    ),
    Projects(
      title: "Library management system",
      lang: "Python",
      gitLink: "  -  https://github.com/Bimal-kc/LibraryManagementSystem",
    ),
    Projects(
      title: "Course registration system",
      lang: "Java     ",
      gitLink: "  -  https://github.com/Bimal-kc/CourseRegistration",
    ),
  ],
);
