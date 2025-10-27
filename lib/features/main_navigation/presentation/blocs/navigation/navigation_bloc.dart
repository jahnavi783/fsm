import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  bool _isDrawerOpen = false;

  NavigationBloc() : super(const NavigationState.initial()) {
    on<NavigationEvent>((event, emit) {
      event.when(
        tabChanged: (index) => emit(NavigationState.tabChanged(index)),
        navigateToTab: (index) => emit(NavigationState.navigateToTab(index)),
        navigateToWorkOrder: (workOrderId) => emit(NavigationState.navigateToWorkOrder(workOrderId)),
        navigateToDocument: (documentId) => emit(NavigationState.navigateToDocument(documentId)),
        navigateToPart: (partId) => emit(NavigationState.navigateToPart(partId)),
        toggleDrawer: () {
          _isDrawerOpen = !_isDrawerOpen;
          emit(_isDrawerOpen
              ? const NavigationState.drawerOpened()
              : const NavigationState.drawerClosed());
        },
        openDrawer: () {
          _isDrawerOpen = true;
          emit(const NavigationState.drawerOpened());
        },
        closeDrawer: () {
          _isDrawerOpen = false;
          emit(const NavigationState.drawerClosed());
        },
      );
    });
  }

  bool get isDrawerOpen => _isDrawerOpen;
}