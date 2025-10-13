// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:fsm/core/router/app_router.dart' as _i1;
import 'package:fsm/features/auth/presentation/pages/login_page.dart' as _i2;
import 'package:fsm/features/auth/presentation/pages/splash_page.dart' as _i3;

/// generated route for
/// [_i1.CalendarPage]
class CalendarRoute extends _i4.PageRouteInfo<void> {
  const CalendarRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CalendarPage();
    },
  );
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i1.DocumentViewerPage]
class DocumentViewerRoute extends _i4.PageRouteInfo<DocumentViewerRouteArgs> {
  DocumentViewerRoute({
    _i5.Key? key,
    required String documentId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DocumentViewerRoute.name,
          args: DocumentViewerRouteArgs(
            key: key,
            documentId: documentId,
          ),
          rawPathParams: {'documentId': documentId},
          initialChildren: children,
        );

  static const String name = 'DocumentViewerRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DocumentViewerRouteArgs>(
          orElse: () => DocumentViewerRouteArgs(
              documentId: pathParams.getString('documentId')));
      return _i1.DocumentViewerPage(
        key: args.key,
        documentId: args.documentId,
      );
    },
  );
}

class DocumentViewerRouteArgs {
  const DocumentViewerRouteArgs({
    this.key,
    required this.documentId,
  });

  final _i5.Key? key;

  final String documentId;

  @override
  String toString() {
    return 'DocumentViewerRouteArgs{key: $key, documentId: $documentId}';
  }
}

/// generated route for
/// [_i1.DocumentsPage]
class DocumentsRoute extends _i4.PageRouteInfo<void> {
  const DocumentsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DocumentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.DocumentsPage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i1.MainNavigationPage]
class MainNavigationRoute extends _i4.PageRouteInfo<void> {
  const MainNavigationRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MainNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainNavigationPage();
    },
  );
}

/// generated route for
/// [_i1.PartsPage]
class PartsRoute extends _i4.PageRouteInfo<void> {
  const PartsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PartsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PartsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.PartsPage();
    },
  );
}

/// generated route for
/// [_i1.ProfilePage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ProfilePage();
    },
  );
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashPage();
    },
  );
}

/// generated route for
/// [_i1.WorkOrderDetailsPage]
class WorkOrderDetailsRoute
    extends _i4.PageRouteInfo<WorkOrderDetailsRouteArgs> {
  WorkOrderDetailsRoute({
    _i5.Key? key,
    required String workOrderId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          WorkOrderDetailsRoute.name,
          args: WorkOrderDetailsRouteArgs(
            key: key,
            workOrderId: workOrderId,
          ),
          rawPathParams: {'workOrderId': workOrderId},
          initialChildren: children,
        );

  static const String name = 'WorkOrderDetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WorkOrderDetailsRouteArgs>(
          orElse: () => WorkOrderDetailsRouteArgs(
              workOrderId: pathParams.getString('workOrderId')));
      return _i1.WorkOrderDetailsPage(
        key: args.key,
        workOrderId: args.workOrderId,
      );
    },
  );
}

class WorkOrderDetailsRouteArgs {
  const WorkOrderDetailsRouteArgs({
    this.key,
    required this.workOrderId,
  });

  final _i5.Key? key;

  final String workOrderId;

  @override
  String toString() {
    return 'WorkOrderDetailsRouteArgs{key: $key, workOrderId: $workOrderId}';
  }
}

/// generated route for
/// [_i1.WorkOrdersPage]
class WorkOrdersRoute extends _i4.PageRouteInfo<void> {
  const WorkOrdersRoute({List<_i4.PageRouteInfo>? children})
      : super(
          WorkOrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrdersRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.WorkOrdersPage();
    },
  );
}
