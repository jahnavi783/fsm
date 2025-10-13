part of 'profile_screen_cubit.dart';

sealed class ProfileScreenState extends Equatable {
  const ProfileScreenState();

  @override
  List<Object> get props => [];
}

final class ProfileScreenInitial extends ProfileScreenState {}

final class ProfileScreenLoadingState extends ProfileScreenState {}

final class ProfileScreenSuccessState extends ProfileScreenState {
  final UserEntity user;

  const ProfileScreenSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

final class ProfileScreenErrorState extends ProfileScreenState {
  final String errorMessage;

  const ProfileScreenErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
