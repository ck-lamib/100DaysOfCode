import 'package:flutter/material.dart';
import 'package:managing_state/parent_manages_state.dart';
import 'package:managing_state/widget_manages_its_state.dart' as ownState;
import 'package:managing_state/mis_match.dart' as misMatch;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // body: ownState.TapButton(),  //widget manages its own state
        // body: ParentWidget(), //parwent widget manages widget state
        body: misMatch.ParentWidget(),
      ),
    );
  }
}
