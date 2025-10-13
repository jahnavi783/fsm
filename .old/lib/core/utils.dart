import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsm_flutter/data/response/wo_complete_request.dart';
import 'package:intl/intl.dart';

String formatDateTime(String dateString) {
  final date = DateTime.parse(dateString);
  final String formatedDate = DateFormat().format(date);
  return formatedDate;
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toString();
}

class JsonDecoder
    implements JsonConverter<List<WoCompletePartsUsedRequest>, String> {
  const JsonDecoder();

  @override
  List<WoCompletePartsUsedRequest> fromJson(String json) => jsonDecode(json)
      .map<WoCompletePartsUsedRequest>(
        (item) =>
            WoCompletePartsUsedRequest.fromJson(item as Map<String, dynamic>),
      )
      .toList();

  @override
  String toJson(List<WoCompletePartsUsedRequest> object) => object.toString();
}

extension TitleCaseExtension on String {
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : '')
        .join(' ');
  }
}
