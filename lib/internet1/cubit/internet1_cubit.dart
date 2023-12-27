import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet1_state.dart';

class Internet1Cubit extends Cubit<Internet1State> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectiviySubscription;
  Internet1Cubit() : super(Internet1Initial()) {
    connectiviySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(Internet1GainedState());
      } else {
        emit(Internet1LostState());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectiviySubscription!.cancel();
    return super.close();
  }
}
