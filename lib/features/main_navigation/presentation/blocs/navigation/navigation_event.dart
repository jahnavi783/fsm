import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_event.freezed.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.tabChanged(int index) = _TabChanged;
  const factory NavigationEvent.navigateToTab(int index) = _NavigateToTab;
  const factory NavigationEvent.navigateToWorkOrder(int workOrderId) = _NavigateToWorkOrder;
  const factory NavigationEvent.navigateToDocument(int documentId) = _NavigateToDocument;
  const factory NavigationEvent.navigateToPart(int partId) = _NavigateToPart;
}