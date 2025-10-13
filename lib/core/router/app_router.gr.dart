// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:fsm/core/router/app_router.dart' as _i1;
import 'package:fsm/features/auth/presentation/pages/login_page.dart' as _i5;
import 'package:fsm/features/auth/presentation/pages/splash_page.dart' as _i6;
import 'package:fsm/features/documents/presentation/pages/document_viewer_page.dart'
    as _i3;
import 'package:fsm/features/documents/presentation/pages/documents_page.dart'
    as _i4;
import 'package:fsm/features/work_orders/presentation/pages/dashboard_page.dart'
    as _i2;
import 'package:fsm/features/work_orders/presentation/pages/work_order_details_page.dart'
    as _i7;

/// generated route for
/// [_i1.CalendarPage]
class CalendarRoute extends _i8.PageRouteInfo<void> {
  const CalendarRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.CalendarPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.DocumentViewerPage]
class DocumentViewerRoute extends _i8.PageRouteInfo<DocumentViewerRouteArgs> {
  DocumentViewerRoute({
    _i9.Key? key,
    required int documentId,
    List<_i8.PageRouteInfo>? children,
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

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DocumentViewerRouteArgs>(
          orElse: () => DocumentViewerRouteArgs(
              documentId: pathParams.getInt('documentId')));
      return _i3.DocumentViewerPage(
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

  final _i9.Key? key;

  final int documentId;

  @override
  String toString() {
    return 'DocumentViewerRouteArgs{key: $key, documentId: $documentId}';
  }
}

/// generated route for
/// [_i4.DocumentsPage]
class DocumentsRoute extends _i8.PageRouteInfo<void> {
  const DocumentsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DocumentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.DocumentsPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i1.MainNavigationPage]
class MainNavigationRoute extends _i8.PageRouteInfo<void> {
  const MainNavigationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainNavigationPage();
    },
  );
}

/// generated route for
/// [_i1.PartsPage]
class PartsRoute extends _i8.PageRouteInfo<void> {
  const PartsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          PartsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PartsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.PartsPage();
    },
  );
}

/// generated route for
/// [_i1.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.ProfilePage();
    },
  );
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashPage();
    },
  );
}

/// generated route for
/// [_i7.WorkOrderDetailsPage]
class WorkOrderDetailsRoute
    extends _i8.PageRouteInfo<WorkOrderDetailsRouteArgs> {
  WorkOrderDetailsRoute({
    _i9.Key? key,
    required int workOrderId,
    List<_i8.PageRouteInfo>? children,
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

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WorkOrderDetailsRouteArgs>(
          orElse: () => WorkOrderDetailsRouteArgs(
              workOrderId: pathParams.getInt('workOrderId')));
      return _i7.WorkOrderDetailsPage(
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

  final _i9.Key? key;

  final int workOrderId;

  @override
  String toString() {
    return 'WorkOrderDetailsRouteArgs{key: $key, workOrderId: $workOrderId}';
  }
}

/// generated route for
/// [_i1.WorkOrdersPage]
class WorkOrdersRoute extends _i8.PageRouteInfo<void> {
  const WorkOrdersRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WorkOrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrdersRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.WorkOrdersPage();
    },
  );
}
