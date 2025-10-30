import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/profile_entity.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = _LoadProfile;
  const factory ProfileEvent.updateProfile(ProfileEntity profile) =
      _UpdateProfile;
  const factory ProfileEvent.loadPreferences() = _LoadPreferences;
  const factory ProfileEvent.updatePreferences(ProfilePreferences preferences) =
      _UpdatePreferences;
}
