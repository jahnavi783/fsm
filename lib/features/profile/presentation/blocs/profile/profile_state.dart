import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/profile_entity.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded({
    required ProfileEntity profile,
    required ProfilePreferences preferences,
  }) = _Loaded;
  const factory ProfileState.updating() = _Updating;
  const factory ProfileState.updated({
    required ProfileEntity profile,
    required ProfilePreferences preferences,
  }) = _Updated;
  const factory ProfileState.preferencesUpdated({
    required ProfileEntity profile,
    required ProfilePreferences preferences,
  }) = _PreferencesUpdated;
  const factory ProfileState.accountDeleted() = _AccountDeleted;
  const factory ProfileState.loggedOut() = _LoggedOut;
  const factory ProfileState.error(String message) = _Error;
}