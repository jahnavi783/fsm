// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:fsm/features/auth/presentation/pages/login_page.dart' as _i7;
import 'package:fsm/features/auth/presentation/pages/splash_page.dart' as _i12;
import 'package:fsm/features/calendar/presentation/pages/calendar_page.dart'
    as _i1;
import 'package:fsm/features/debug/presentation/pages/developer_options_page.dart'
    as _i3;
import 'package:fsm/features/documents/presentation/pages/document_viewer_page.dart'
    as _i4;
import 'package:fsm/features/documents/presentation/pages/documents_page.dart'
    as _i5;
import 'package:fsm/features/documents/presentation/pages/documents_page_redesign.dart'
    as _i6;
import 'package:fsm/features/main_navigation/presentation/pages/main_navigation_page.dart'
    as _i8;
import 'package:fsm/features/parts/domain/entities/part_entity.dart' as _i17;
import 'package:fsm/features/parts/presentation/pages/part_details_page.dart'
    as _i9;
import 'package:fsm/features/parts/presentation/pages/parts_page.dart' as _i10;
import 'package:fsm/features/profile/presentation/pages/profile_page.dart'
    as _i11;
import 'package:fsm/features/work_orders/presentation/pages/dashboard_page.dart'
    as _i2;
import 'package:fsm/features/work_orders/presentation/pages/work_order_details_page.dart'
    as _i13;
import 'package:fsm/features/work_orders/presentation/pages/work_order_start_page.dart'
    as _i14;

/// generated route for
/// [_i1.CalendarPage]
class CalendarRoute extends _i15.PageRouteInfo<void> {
  const CalendarRoute({List<_i15.PageRouteInfo>? children})
      : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i1.CalendarPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
      : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.DeveloperOptionsPage]
class DeveloperOptionsRoute extends _i15.PageRouteInfo<void> {
  const DeveloperOptionsRoute({List<_i15.PageRouteInfo>? children})
      : super(DeveloperOptionsRoute.name, initialChildren: children);

  static const String name = 'DeveloperOptionsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.DeveloperOptionsPage();
    },
  );
}

/// generated route for
/// [_i4.DocumentViewerPage]
class DocumentViewerRoute extends _i15.PageRouteInfo<DocumentViewerRouteArgs> {
  DocumentViewerRoute({
    _i16.Key? key,
    required String documentId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          DocumentViewerRoute.name,
          args: DocumentViewerRouteArgs(key: key, documentId: documentId),
          rawPathParams: {'documentId': documentId},
          initialChildren: children,
        );

  static const String name = 'DocumentViewerRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DocumentViewerRouteArgs>(
        orElse: () => DocumentViewerRouteArgs(
          documentId: pathParams.getString('documentId'),
        ),
      );
      return _i4.DocumentViewerPage(key: args.key, documentId: args.documentId);
    },
  );
}

class DocumentViewerRouteArgs {
  const DocumentViewerRouteArgs({this.key, required this.documentId});

  final _i16.Key? key;

  final String documentId;

  @override
  String toString() {
    return 'DocumentViewerRouteArgs{key: $key, documentId: $documentId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DocumentViewerRouteArgs) return false;
    return key == other.key && documentId == other.documentId;
  }

  @override
  int get hashCode => key.hashCode ^ documentId.hashCode;
}

/// generated route for
/// [_i5.DocumentsPage]
class DocumentsRoute extends _i15.PageRouteInfo<void> {
  const DocumentsRoute({List<_i15.PageRouteInfo>? children})
      : super(DocumentsRoute.name, initialChildren: children);

  static const String name = 'DocumentsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i5.DocumentsPage();
    },
  );
}

/// generated route for
/// [_i6.DocumentsPageRedesign]
class DocumentsRouteRedesign extends _i15.PageRouteInfo<void> {
  const DocumentsRouteRedesign({List<_i15.PageRouteInfo>? children})
      : super(DocumentsRouteRedesign.name, initialChildren: children);

  static const String name = 'DocumentsRouteRedesign';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.DocumentsPageRedesign();
    },
  );
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage();
    },
  );
}

/// generated route for
/// [_i8.MainNavigationPage]
class MainNavigationRoute extends _i15.PageRouteInfo<void> {
  const MainNavigationRoute({List<_i15.PageRouteInfo>? children})
      : super(MainNavigationRoute.name, initialChildren: children);

  static const String name = 'MainNavigationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.MainNavigationPage();
    },
  );
}

/// generated route for
/// [_i9.PartDetailsPage]
class PartDetailsRoute extends _i15.PageRouteInfo<PartDetailsRouteArgs> {
  PartDetailsRoute({
    _i16.Key? key,
    required int partId,
    _i17.PartEntity? part,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PartDetailsRoute.name,
          args: PartDetailsRouteArgs(key: key, partId: partId, part: part),
          initialChildren: children,
        );

  static const String name = 'PartDetailsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PartDetailsRouteArgs>();
      return _i9.PartDetailsPage(
        key: args.key,
        partId: args.partId,
        part: args.part,
      );
    },
  );
}

class PartDetailsRouteArgs {
  const PartDetailsRouteArgs({this.key, required this.partId, this.part});

  final _i16.Key? key;

  final int partId;

  final _i17.PartEntity? part;

  @override
  String toString() {
    return 'PartDetailsRouteArgs{key: $key, partId: $partId, part: $part}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PartDetailsRouteArgs) return false;
    return key == other.key && partId == other.partId && part == other.part;
  }

  @override
  int get hashCode => key.hashCode ^ partId.hashCode ^ part.hashCode;
}

/// generated route for
/// [_i10.PartsPage]
class PartsRoute extends _i15.PageRouteInfo<void> {
  const PartsRoute({List<_i15.PageRouteInfo>? children})
      : super(PartsRoute.name, initialChildren: children);

  static const String name = 'PartsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.PartsPage();
    },
  );
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfilePage();
    },
  );
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashPage();
    },
  );
}

/// generated route for
/// [_i13.WorkOrderDetailsPage]
class WorkOrderDetailsRoute
    extends _i15.PageRouteInfo<WorkOrderDetailsRouteArgs> {
  WorkOrderDetailsRoute({
    _i16.Key? key,
    required int workOrderId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          WorkOrderDetailsRoute.name,
          args: WorkOrderDetailsRouteArgs(key: key, workOrderId: workOrderId),
          rawPathParams: {'workOrderId': workOrderId},
          initialChildren: children,
        );

  static const String name = 'WorkOrderDetailsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WorkOrderDetailsRouteArgs>(
        orElse: () => WorkOrderDetailsRouteArgs(
          workOrderId: pathParams.getInt('workOrderId'),
        ),
      );
      return _i13.WorkOrderDetailsPage(
        key: args.key,
        workOrderId: args.workOrderId,
      );
    },
  );
}

class WorkOrderDetailsRouteArgs {
  const WorkOrderDetailsRouteArgs({this.key, required this.workOrderId});

  final _i16.Key? key;

  final int workOrderId;

  @override
  String toString() {
    return 'WorkOrderDetailsRouteArgs{key: $key, workOrderId: $workOrderId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WorkOrderDetailsRouteArgs) return false;
    return key == other.key && workOrderId == other.workOrderId;
  }

  @override
  int get hashCode => key.hashCode ^ workOrderId.hashCode;
}

/// generated route for
/// [_i14.WorkOrderStartPage]
class WorkOrderStartRoute extends _i15.PageRouteInfo<WorkOrderStartRouteArgs> {
  WorkOrderStartRoute({
    _i16.Key? key,
    required int workOrderId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          WorkOrderStartRoute.name,
          args: WorkOrderStartRouteArgs(key: key, workOrderId: workOrderId),
          rawPathParams: {'workOrderId': workOrderId},
          initialChildren: children,
        );

  static const String name = 'WorkOrderStartRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WorkOrderStartRouteArgs>(
        orElse: () => WorkOrderStartRouteArgs(
          workOrderId: pathParams.getInt('workOrderId'),
        ),
      );
      return _i14.WorkOrderStartPage(
        key: args.key,
        workOrderId: args.workOrderId,
      );
    },
  );
}

class WorkOrderStartRouteArgs {
  const WorkOrderStartRouteArgs({this.key, required this.workOrderId});

  final _i16.Key? key;

  final int workOrderId;

  @override
  String toString() {
    return 'WorkOrderStartRouteArgs{key: $key, workOrderId: $workOrderId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WorkOrderStartRouteArgs) return false;
    return key == other.key && workOrderId == other.workOrderId;
  }

  @override
  int get hashCode => key.hashCode ^ workOrderId.hashCode;
}
