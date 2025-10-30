import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/profile_entity.dart';
import '../../../domain/usecases/get_preferences_usecase.dart';
import '../../../domain/usecases/get_profile_usecase.dart';
import '../../../domain/usecases/update_preferences_usecase.dart';
import '../../../domain/usecases/update_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetPreferencesUseCase _getPreferencesUseCase;
  final UpdatePreferencesUseCase _updatePreferencesUseCase;

  ProfileEntity? _currentProfile;
  ProfilePreferences? _currentPreferences;

  ProfileBloc(
    this._getProfileUseCase,
    this._updateProfileUseCase,
    this._getPreferencesUseCase,
    this._updatePreferencesUseCase,
  ) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
          loadProfile: () => _onLoadProfile(emit),
          updateProfile: (profile) => _onUpdateProfile(emit, profile),
          loadPreferences: () => _onLoadPreferences(emit),
          updatePreferences: (preferences) =>
              _onUpdatePreferences(emit, preferences));
    });
  }

  Future<void> _onLoadProfile(Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());

    final result = await _getProfileUseCase();

    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (profile) {
        _currentProfile = profile;
        _currentPreferences = profile.preferences;
        emit(ProfileState.loaded(
          profile: profile,
          preferences: profile.preferences,
        ));
      },
    );
  }

  Future<void> _onUpdateProfile(
      Emitter<ProfileState> emit, ProfileEntity profile) async {
    if (_currentProfile == null || _currentPreferences == null) {
      emit(const ProfileState.error('Profile not loaded'));
      return;
    }

    emit(const ProfileState.updating());

    final result = await _updateProfileUseCase(profile);

    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (updatedProfile) {
        _currentProfile = updatedProfile;
        emit(ProfileState.updated(
          profile: updatedProfile,
          preferences: _currentPreferences!,
        ));
      },
    );
  }

  Future<void> _onLoadPreferences(Emitter<ProfileState> emit) async {
    if (_currentProfile == null) {
      emit(const ProfileState.error('Profile not loaded'));
      return;
    }

    final result = await _getPreferencesUseCase();

    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (preferences) {
        _currentPreferences = preferences;
        emit(ProfileState.loaded(
          profile: _currentProfile!,
          preferences: preferences,
        ));
      },
    );
  }

  Future<void> _onUpdatePreferences(
      Emitter<ProfileState> emit, ProfilePreferences preferences) async {
    if (_currentProfile == null) {
      emit(const ProfileState.error('Profile not loaded'));
      return;
    }

    emit(const ProfileState.updating());

    final result = await _updatePreferencesUseCase(preferences);

    result.fold(
      (failure) => emit(ProfileState.error(failure.message)),
      (updatedPreferences) {
        _currentPreferences = updatedPreferences;
        // Update the profile with new preferences
        final updatedProfile =
            _currentProfile!.copyWith(preferences: updatedPreferences);
        _currentProfile = updatedProfile;

        emit(ProfileState.preferencesUpdated(
          profile: updatedProfile,
          preferences: updatedPreferences,
        ));
      },
    );
  }

  Future<void> _onDeleteAccount(Emitter<ProfileState> emit) async {
    emit(const ProfileState.updating());

    // Note: Delete account use case would need to be implemented
    // For now, we'll just emit an error
    emit(const ProfileState.error(
        'Delete account functionality not implemented'));
  }

  // Getters for current state
  ProfileEntity? get currentProfile => _currentProfile;
  ProfilePreferences? get currentPreferences => _currentPreferences;
}
