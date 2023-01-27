import 'package:counter_app_cubit/logic/cubit/counter_cubit.dart';
import 'package:counter_app_cubit/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // void showSnackBar(value) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(value),
  //     duration: const Duration(seconds: 1),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('incremented'),
                    duration: Duration(seconds: 0),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(seconds: 0),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (() => BlocProvider.of<CounterCubit>(context).increment()),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (() => BlocProvider.of<CounterCubit>(context).decrement()),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: (() => Navigator.of(context).pushNamed('/second')),
              color: widget.color,
              child: const Text("push to second screen"),
            ),
            MaterialButton(
              onPressed: (() => Navigator.of(context).pushNamed('/third')),
              color: widget.color,
              child: const Text("push to third screen"),
            ),
            // const SizedBox(
            //   height: 24,
            // ),
            // const MaterialButton(
            //   onPressed: null,
            //   child: Text("push to second screen"),
            // )
          ],
        ),
      ),
    );
  }
}
