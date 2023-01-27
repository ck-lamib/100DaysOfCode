import 'package:counter_app_cubit/logic/cubit/counter_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void showSnackBar(value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
      duration: const Duration(seconds: 1),
    ));
  }

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
                  showSnackBar("Incremented");
                } else {
                  showSnackBar("Decremented");
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
                  tooltip: 'Incrementt',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (() => BlocProvider.of<CounterCubit>(context).decrement()),
                  tooltip: 'Decrementt',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: (() => Navigator.of(context).pop()),
              color: widget.color,
              child: const Text("pop to 1st screen"),
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
