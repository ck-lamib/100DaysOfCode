import 'package:flutter/material.dart';
import 'package:my_cv/common_widget/bold_topic.dart';
import 'package:my_cv/custom_icon.dart';
import 'package:my_cv/common_widget/links.dart';
import 'package:my_cv/components/education.dart';
import 'package:my_cv/components/interest.dart';

import 'package:my_cv/components/me.dart';
import 'package:my_cv/components/new_language.dart';
import 'package:my_cv/components/projects.dart';
import 'package:my_cv/components/skill.dart';
import 'package:my_cv/components/title.dart';
import 'package:my_cv/components/work_experience.dart';
import 'package:my_cv/util/details.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    //this is column of all
    return Column(
      children: [
        //container for name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //column for name
            nameAndbio(),
            //column for profile links
            titleLinks(),
          ],
        ),
        space(20),
        horizontalline,
        space(10),

        me,
        space(10),
        horizontalline,
        space(10),

        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldTopic("Education"),
                          const Education(
                            title: "SEE",
                            schoolName: "Nepal APF School - Kathmandu",
                            date: "2015-2017",
                          ),
                          const Education(
                              title: "High School (Science)",
                              schoolName: "Sagarmatha Secondary School - Pokhara",
                              date: "2018-2020"),
                          const Education(
                              title: "BIT (Current)",
                              schoolName: "Informatics College - Pokhara",
                              date: "2021-2023"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldTopic("Experience"),
                          const WorkExperience(
                            title: "Quality assurance",
                            companyName: "BlackTech",
                            location: "Pokhara",
                            date: "June-August, 2022",
                            desc:
                                "Black Tech is an aspiring aspiring software company building high-end software located at 0 km, Pokhara. I work at Black tech as a QA intern.\nMy works at Black Tech includes: \n   1.  Collaborating with developer and senior QA team for testing to achieve high-quality production of Restrox app. \n   2. To track the quality of app using testing tools like cypress, jmeter. \n   3. Executing test script.",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldTopic("Projects"),
                          projectDetails,
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 50, child: verticalline),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            boldTopic("Skills"),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Technical",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colorss().headingtextColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: technicalValues(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Professional",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colorss().headingtextColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: professionalValues(),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            boldTopic("Languages"),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: languageValues(),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            boldTopic("Interests"),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: interestValues(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        space(10),
        horizontalline,
        space(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Links(iconData: CustomIcon.githubCircled, link: 'github.com/ck-lamib'),
            Links(iconData: CustomIcon.linkedin, link: 'linkedin.com/in/ck-lamib'),
          ],
        ),
      ],
    );
  }
}
