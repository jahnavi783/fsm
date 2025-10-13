import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/injection.dart' show serviceLocator;

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());
  final RestClient _restClient = serviceLocator<RestClient>();

  Future<void> fetchAllWorkOrders() async {
    emit(CalendarLoading());
    try {
      // Assuming the API supports fetching all work orders by not passing status
      // or by having a specific endpoint or parameter for all.
      // Adjust page and limit as necessary, or implement pagination if needed.
      final response = await _restClient.getWorkOrders(page: 1, limit: 1000);
      emit(CalendarSuccess(workOrders: response.workOrders));
    } catch (e) {
      debugPrint("Error fetching all work orders:--------- $e");
      emit(CalendarFailure(error: e.toString()));
    }
  }
}
