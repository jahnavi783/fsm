import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../network/network_info.dart';
import 'connectivity_event.dart';
import 'connectivity_state.dart';

@singleton
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final NetworkInfo _networkInfo;
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  ConnectivityBloc(
    this._networkInfo,
    this._connectivity,
  ) : super(const ConnectivityState.initial()) {
    on<ConnectivityEvent>((event, emit) async {
      await event.when(
        started: () => _onStarted(emit),
        connectivityChanged: (isConnected) => _onConnectivityChanged(emit, isConnected),
        checkConnectivity: () => _onCheckConnectivity(emit),
      );
    });
  }

  Future<void> _onStarted(Emitter<ConnectivityState> emit) async {
    // Start listening to connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        final isConnected = results.any((result) => 
          result == ConnectivityResult.mobile || 
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet
        );
        add(ConnectivityEvent.connectivityChanged(isConnected));
      },
    );

    // Check initial connectivity
    add(const ConnectivityEvent.checkConnectivity());
  }

  Future<void> _onConnectivityChanged(
    Emitter<ConnectivityState> emit,
    bool isConnected,
  ) async {
    if (isConnected) {
      // Double-check with actual network request
      final actuallyConnected = await _networkInfo.isConnected;
      if (actuallyConnected) {
        emit(const ConnectivityState.connected());
      } else {
        emit(const ConnectivityState.disconnected());
      }
    } else {
      emit(const ConnectivityState.disconnected());
    }
  }

  Future<void> _onCheckConnectivity(Emitter<ConnectivityState> emit) async {
    emit(const ConnectivityState.checking());
    
    try {
      final isConnected = await _networkInfo.isConnected;
      if (isConnected) {
        emit(const ConnectivityState.connected());
      } else {
        emit(const ConnectivityState.disconnected());
      }
    } catch (e) {
      emit(const ConnectivityState.disconnected());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}