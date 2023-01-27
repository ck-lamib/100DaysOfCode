part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final bool? isIncremented;
  const CounterState({required this.counter, this.isIncremented});

  @override
  List<Object?> get props => [counter, isIncremented];
}
