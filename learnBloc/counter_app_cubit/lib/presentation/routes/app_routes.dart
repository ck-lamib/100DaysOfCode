// ignore_for_file: dead_code

import 'package:counter_app_cubit/logic/cubit/counter_cubit.dart';
import 'package:counter_app_cubit/presentation/screens/home_screen.dart';
import 'package:counter_app_cubit/presentation/screens/second_screen.dart';
import 'package:counter_app_cubit/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  final CounterCubit _counterCubit = CounterCubit();
  Route onGeneratedRoutes(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MyHomeScreen(title: "Home Screen", color: Colors.blue));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(title: "Home Screen", color: Colors.red));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(title: "3rdScreen", color: Colors.green));
        break;
      default:
        return null!;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
