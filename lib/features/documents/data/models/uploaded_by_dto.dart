import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploaded_by_dto.freezed.dart';
part 'uploaded_by_dto.g.dart';

/// DTO for the user who uploaded a document
/// Maps to the 'uploaded_by' object in the API response
@freezed
abstract class UploadedByDto with _$UploadedByDto {
  const UploadedByDto._();

  const factory UploadedByDto({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') String? lastName,
    required String email,
    @JsonKey(name: 'role_id') required int roleId,
  }) = _UploadedByDto;

  factory UploadedByDto.fromJson(Map<String, dynamic> json) =>
      _$UploadedByDtoFromJson(json);

  /// Get full name of the uploader
  String get fullName {
    if (lastName != null && lastName!.isNotEmpty) {
      return '$firstName $lastName';
    }
    return firstName;
  }
}
