import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_service_state.dart';

class ThemeServiceCubit extends Cubit<ThemeServiceState> {
  ThemeServiceCubit() : super(const ThemeServiceInitial(isDarkMode: false));

  void toggleTheme() {
    emit(ThemeServiceState(isDarkMode: !state.isDarkMode));
  }
}
