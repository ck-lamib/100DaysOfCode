import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app_cubit/constants/enums.dart';
import 'package:counter_app_cubit/logic/cubit/internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  InternetCubit({required this.connectivity}) : super(InternetLoading());
  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));
  void emitInternetDisconnected() => emit(InternetDisconnected());
}
