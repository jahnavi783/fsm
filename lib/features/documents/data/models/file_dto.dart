import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/file_entity.dart';

part 'file_dto.freezed.dart';
part 'file_dto.g.dart';

/// DTO for individual file within a document upload
/// Maps to the 'files' array in the API response
@freezed
abstract class FileDto with _$FileDto {
  const FileDto._();

  const factory FileDto({
    required int id,
    @JsonKey(name: 'file_name') String? fileName,
    @JsonKey(name: 'file_url') required String fileUrl,
    @JsonKey(name: 'file_type') required String fileType,
    @JsonKey(name: 'file_size') required int fileSize,
  }) = _FileDto;

  factory FileDto.fromJson(Map<String, dynamic> json) =>
      _$FileDtoFromJson(json);

  /// Extract file extension from fileName
  String get fileExtension {
    if (fileName?.isEmpty ?? true) {
      return '';
    }
    return fileName!.split('.').last.toLowerCase();
  }

  /// Check if file is a PDF
  bool get isPdf => fileExtension == 'pdf';

  /// Check if file is an image
  bool get isImage =>
      ['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(fileExtension);

  /// Format file size for display
  String get fileSizeFormatted {
    if (fileSize < 1024) {
      return '$fileSize B';
    } else if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }
}

extension FileDtoX on FileDto {
  /// Convert FileDto to FileEntity domain model
  FileEntity toEntity({
    bool? isDownloaded,
    String? localPath,
  }) {
    return FileEntity(
      id: id,
      fileName: fileName,
      fileUrl: fileUrl,
      fileType: fileType,
      fileSize: fileSize,
      isDownloaded: isDownloaded,
      localPath: localPath,
    );
  }
}
