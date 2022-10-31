import 'package:dribbble_design_clone/widget/exercise_tile.dart';
import 'package:dribbble_design_clone/widget/mood_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      ]),
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          const Text(
                            "Hi, Bimal!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "31 oct, 2022",
                            style: TextStyle(color: Colors.blue[100]),
                          ),
                        ],
                      ),

                      //notification
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          size: 35,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "How do you feel?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // moodIcons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      MoodIcons(
                        moodIcon: "😔",
                        reaction: 'Badly',
                      ),
                      MoodIcons(
                        moodIcon: "😊",
                        reaction: 'Fine',
                      ),
                      MoodIcons(
                        moodIcon: "😁",
                        reaction: 'Well',
                      ),
                      MoodIcons(
                        moodIcon: "😆",
                        reaction: 'Excellent',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // white screen
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(children: [
                    Icon(
                      Icons.horizontal_rule,
                      size: 40,
                      color: Colors.blue[400],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Exercise',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.more_horiz_rounded,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // listview of exercise
                    Expanded(
                      child: ListView(
                        children: [
                          ExerciseTile(
                            emoji: Icons.favorite,
                            exerciseNum: 16,
                            exerciseTitle: "Speaking Skills",
                            backColor: Colors.blue[200],
                          ),
                          const ExerciseTile(
                            emoji: Icons.food_bank_outlined,
                            exerciseNum: 6,
                            exerciseTitle: "Proper eating",
                            backColor: Colors.orange,
                          ),
                          const ExerciseTile(
                            emoji: Icons.run_circle_outlined,
                            exerciseNum: 18,
                            exerciseTitle: "Running",
                            backColor: Colors.green,
                          ),
                          const ExerciseTile(
                            emoji: Icons.girl,
                            exerciseNum: 11,
                            exerciseTitle: "Girls seceret",
                            backColor: Colors.pink,
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
