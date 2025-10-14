import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _Initial;
  const factory NavigationState.tabChanged(int index) = _TabChanged;
  const factory NavigationState.navigateToTab(int index) = _NavigateToTab;
  const factory NavigationState.navigateToWorkOrder(int workOrderId) = _NavigateToWorkOrder;
  const factory NavigationState.navigateToDocument(int documentId) = _NavigateToDocument;
  const factory NavigationState.navigateToPart(int partId) = _NavigateToPart;
}