part of 'theme_service_cubit.dart';

@immutable
class ThemeServiceState {
  final bool isDarkMode;

  const ThemeServiceState({required this.isDarkMode});
}

final class ThemeServiceInitial extends ThemeServiceState {
  const ThemeServiceInitial({required super.isDarkMode});
}
