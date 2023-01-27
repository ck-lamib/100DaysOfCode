import 'package:counter_app_cubit/constants/enums.dart';
import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  const InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
