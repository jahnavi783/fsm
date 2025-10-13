import 'package:equatable/equatable.dart';
import 'package:fsm_flutter/core/services/enums.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();

  @override
  List<Object?> get props => [];
}

class DocumentsRequested extends DocumentEvent {
  const DocumentsRequested();
}

class DocumentsRefreshRequested extends DocumentEvent {
  const DocumentsRefreshRequested();
}

class DocumentsSearchRequested extends DocumentEvent {
  final String keyword;

  const DocumentsSearchRequested(this.keyword);

  @override
  List<Object?> get props => [keyword];
}

class DocumentsCategoryFilterRequested extends DocumentEvent {
  final DocumentCategory? category;

  const DocumentsCategoryFilterRequested(this.category);

  @override
  List<Object?> get props => [category];
}

class DocumentsModelFilterRequested extends DocumentEvent {
  final String? model;

  const DocumentsModelFilterRequested(this.model);

  @override
  List<Object?> get props => [model];
}

class DocumentsLoadMore extends DocumentEvent {
  const DocumentsLoadMore();
}
