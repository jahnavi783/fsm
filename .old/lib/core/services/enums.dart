import 'package:freezed_annotation/freezed_annotation.dart';

enum DocumentCategory {
  @JsonValue('manual')
  manual,
  @JsonValue('sop')
  sop,
  @JsonValue('repair_guide')
  repair_guide,
  @JsonValue('other')
  other;

  @override
  String toString() {
    return switch (this) {
      DocumentCategory.manual => 'manual',
      DocumentCategory.sop => 'sop',
      DocumentCategory.repair_guide => 'repair_guide',
      DocumentCategory.other => 'other',
    };
  }
}
