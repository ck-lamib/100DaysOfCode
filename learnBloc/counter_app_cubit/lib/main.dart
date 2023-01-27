// import 'package:counter_app_cubit/logic/cubit/counter_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app_cubit/logic/cubit/counter_cubit.dart';
import 'package:counter_app_cubit/logic/cubit/internet_cubit.dart';
import 'package:counter_app_cubit/presentation/routes/app_routes.dart';
// import 'package:counter_app_cubit/presentation/routes/app_routes.dart';
// import 'package:counter_app_cubit/presentation/screens/home_screen.dart';
// import 'package:counter_app_cubit/presentation/screens/second_screen.dart';
// import 'package:counter_app_cubit/presentation/screens/third_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  final Connectivity connectivity;
  const MyApp({super.key, required this.connectivity, required this.appRoute});

//for namedRoutes
  // final CounterCubit _counterCubit = CounterCubit();

  //for Generated namedRoutes
  // final AppRoute _appRoute = AppRoute();

  //we dont have to close for blocProvider
  // @override
  // void dispose() {
  //for namedRoutes
  // _counterCubit.close();

  //for Generated namedRoutes
  // _appRoute.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        //for namedRoutes
        // routes: {
        //   '/': ((context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const MyHomeScreen(title: "HomeScreen", color: Colors.blue),
        //       )),
        //   '/second': ((context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const SecondScreen(title: "2ndScreen", color: Colors.red),
        //       )),
        //   '/third': ((context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const ThirdScreen(title: "3rdScreen", color: Colors.green),
        //       )),
        // },

        //for generated namedRoutes
        // onGenerateRoute: _appRoute.onGeneratedRoutes,
        onGenerateRoute: appRoute.onGeneratedRoutes,
      ),
    );
  }
}
