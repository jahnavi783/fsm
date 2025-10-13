import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants.dart';
import '../../../../data/models/work_details_model.dart';

part 'parts_management_state.dart';

class PartsManagementCubit extends Cubit<PartsManagementState> {
  PartsManagementCubit() : super(PartsManagementInitial());

}
