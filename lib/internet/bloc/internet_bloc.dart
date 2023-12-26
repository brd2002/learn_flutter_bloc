import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetGainedState());
      } else {
        emit(InternetLostState());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription!.cancel();
    return super.close();
  }
}
