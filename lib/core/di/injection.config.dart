// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api/auth_api_client.dart' as _i541;
import '../../features/auth/data/datasources/auth_local_datasource.dart'
    as _i992;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/di/auth_module.dart' as _i521;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/i_auth_repository.dart'
    as _i589;
import '../../features/auth/domain/usecases/check_auth_usecase.dart' as _i831;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/refresh_token_usecase.dart'
    as _i157;
import '../../features/auth/presentation/blocs/auth/auth_bloc.dart' as _i331;
import '../../features/calendar/data/api/calendar_api_client.dart' as _i584;
import '../../features/calendar/data/api/calendar_api_module.dart' as _i347;
import '../../features/calendar/data/datasources/calendar_local_datasource.dart'
    as _i494;
import '../../features/calendar/data/datasources/calendar_remote_datasource.dart'
    as _i123;
import '../../features/calendar/data/repositories/calendar_repository_impl.dart'
    as _i712;
import '../../features/calendar/domain/repositories/i_calendar_repository.dart'
    as _i342;
import '../../features/calendar/domain/usecases/get_calendar_events_usecase.dart'
    as _i377;
import '../../features/calendar/domain/usecases/get_daily_schedule_usecase.dart'
    as _i614;
import '../../features/calendar/domain/usecases/optimize_route_usecase.dart'
    as _i316;
import '../../features/calendar/presentation/blocs/calendar/calendar_bloc.dart'
    as _i139;
import '../../features/documents/data/api/document_api_client.dart' as _i936;
import '../../features/documents/data/datasources/document_local_datasource.dart'
    as _i506;
import '../../features/documents/data/datasources/document_remote_datasource.dart'
    as _i749;
import '../../features/documents/data/di/document_module.dart' as _i843;
import '../../features/documents/data/repositories/document_repository_impl.dart'
    as _i113;
import '../../features/documents/domain/repositories/i_document_repository.dart'
    as _i121;
import '../../features/documents/domain/usecases/download_document_usecase.dart'
    as _i750;
import '../../features/documents/domain/usecases/get_document_by_id_usecase.dart'
    as _i937;
import '../../features/documents/domain/usecases/get_document_categories_usecase.dart'
    as _i1041;
import '../../features/documents/domain/usecases/get_documents_usecase.dart'
    as _i911;
import '../../features/documents/domain/usecases/search_documents_usecase.dart'
    as _i633;
import '../../features/documents/presentation/blocs/documents/documents_bloc.dart'
    as _i239;
import '../../features/main_navigation/presentation/blocs/navigation/navigation_bloc.dart'
    as _i465;
import '../../features/parts/data/api/parts_api_client.dart' as _i1011;
import '../../features/parts/data/api/parts_api_module.dart' as _i33;
import '../../features/parts/data/datasources/parts_local_datasource.dart'
    as _i641;
import '../../features/parts/data/datasources/parts_remote_datasource.dart'
    as _i747;
import '../../features/parts/data/repositories/parts_repository_impl.dart'
    as _i644;
import '../../features/parts/domain/repositories/i_parts_repository.dart'
    as _i490;
import '../../features/parts/domain/usecases/check_part_availability_usecase.dart'
    as _i1036;
import '../../features/parts/domain/usecases/get_low_stock_parts_usecase.dart'
    as _i1054;
import '../../features/parts/domain/usecases/get_parts_usecase.dart' as _i637;
import '../../features/parts/domain/usecases/search_parts_usecase.dart'
    as _i170;
import '../../features/parts/presentation/blocs/parts/parts_bloc.dart' as _i344;
import '../../features/permission/data/datasources/permission_remote_datasource.dart'
    as _i544;
import '../../features/permission/data/di/permission_module.dart' as _i469;
import '../../features/permission/domain/repositories/i_permission_repository.dart'
    as _i165;
import '../../features/permission/domain/usecases/check_multiple_permission_status_usecase.dart'
    as _i992;
import '../../features/permission/domain/usecases/check_permission_status_usecase.dart'
    as _i428;
import '../../features/permission/domain/usecases/open_app_settings_usecase.dart'
    as _i418;
import '../../features/permission/domain/usecases/request_multiple_permissions_usecase.dart'
    as _i804;
import '../../features/permission/domain/usecases/request_permission_usecase.dart'
    as _i478;
import '../../features/permission/presentation/blocs/permission/permission_bloc.dart'
    as _i993;
import '../../features/profile/data/api/profile_api_client.dart' as _i751;
import '../../features/profile/data/api/profile_api_module.dart' as _i862;
import '../../features/profile/data/datasources/profile_local_datasource.dart'
    as _i1046;
import '../../features/profile/data/datasources/profile_remote_datasource.dart'
    as _i327;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/i_profile_repository.dart'
    as _i879;
import '../../features/profile/domain/usecases/get_preferences_usecase.dart'
    as _i154;
import '../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i965;
import '../../features/profile/domain/usecases/logout_usecase.dart' as _i17;
import '../../features/profile/domain/usecases/update_preferences_usecase.dart'
    as _i90;
import '../../features/profile/domain/usecases/update_profile_usecase.dart'
    as _i478;
import '../../features/profile/presentation/blocs/profile/profile_bloc.dart'
    as _i349;
import '../../features/work_orders/data/api/work_order_api_client.dart'
    as _i103;
import '../../features/work_orders/data/api/work_order_api_module.dart'
    as _i860;
import '../../features/work_orders/data/datasources/work_order_local_datasource.dart'
    as _i701;
import '../../features/work_orders/data/datasources/work_order_remote_datasource.dart'
    as _i255;
import '../../features/work_orders/data/repositories/work_order_repository_impl.dart'
    as _i937;
import '../../features/work_orders/data/services/work_order_completion_cache_service.dart'
    as _i379;
import '../../features/work_orders/domain/repositories/i_work_order_repository.dart'
    as _i556;
import '../../features/work_orders/domain/usecases/complete_work_order_usecase.dart'
    as _i460;
import '../../features/work_orders/domain/usecases/get_work_order_details_usecase.dart'
    as _i1023;
import '../../features/work_orders/domain/usecases/get_work_orders_usecase.dart'
    as _i874;
import '../../features/work_orders/domain/usecases/pause_work_order_usecase.dart'
    as _i959;
import '../../features/work_orders/domain/usecases/reject_work_order_usecase.dart'
    as _i310;
import '../../features/work_orders/domain/usecases/resume_work_order_usecase.dart'
    as _i489;
import '../../features/work_orders/domain/usecases/start_work_order_usecase.dart'
    as _i188;
import '../../features/work_orders/presentation/blocs/dashboard/dashboard_bloc.dart'
    as _i81;
import '../../features/work_orders/presentation/blocs/work_order_action/work_order_action_bloc.dart'
    as _i532;
import '../../features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart'
    as _i332;
import '../blocs/connectivity/connectivity_bloc.dart' as _i256;
import '../blocs/error/error_bloc.dart' as _i188;
import '../blocs/sync/sync_bloc.dart' as _i538;
import '../network/auth_interceptor.dart' as _i908;
import '../network/dio_client.dart' as _i667;
import '../network/network_info.dart' as _i932;
import '../router/app_router.dart' as _i81;
import '../router/guards/auth_guard.dart' as _i530;
import '../services/error_boundary_service.dart' as _i600;
import '../services/lazy_loading_service.dart' as _i870;
import '../services/location_service.dart' as _i669;
import '../services/logging_service.dart' as _i520;
import '../services/memory_management_service.dart' as _i1066;
import '../services/performance_service.dart' as _i910;
import '../storage/cache_manager.dart' as _i1038;
import '../storage/hive_service.dart' as _i459;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final connectivityModule = _$ConnectivityModule();
    final permissionModule = _$PermissionModule();
    final networkModule = _$NetworkModule();
    final authModule = _$AuthModule();
    final calendarApiModule = _$CalendarApiModule();
    final documentModule = _$DocumentModule();
    final partsApiModule = _$PartsApiModule();
    final profileApiModule = _$ProfileApiModule();
    final workOrderApiModule = _$WorkOrderApiModule();
    gh.factory<_i895.Connectivity>(() => connectivityModule.connectivity);
    gh.factory<_i465.NavigationBloc>(() => _i465.NavigationBloc());
    gh.factory<_i544.PermissionRemoteDataSource>(
        () => _i544.PermissionRemoteDataSource());
    gh.singleton<_i600.ErrorBoundaryService>(
        () => _i600.ErrorBoundaryService());
    gh.singleton<_i870.LazyLoadingService>(() => _i870.LazyLoadingService());
    gh.singleton<_i520.LoggingService>(() => _i520.LoggingService());
    gh.singleton<_i1066.MemoryManagementService>(
        () => _i1066.MemoryManagementService());
    gh.singleton<_i910.PerformanceService>(() => _i910.PerformanceService());
    await gh.singletonAsync<_i459.HiveService>(
      () => _i459.HiveService.create(),
      preResolve: true,
    );
    gh.singleton<_i188.ErrorBloc>(
        () => _i188.ErrorBloc(gh<_i520.LoggingService>()));
    gh.factory<_i1046.ProfileLocalDataSource>(
        () => _i1046.ProfileLocalDataSourceImpl());
    gh.factory<_i494.CalendarLocalDataSource>(
        () => _i494.CalendarLocalDataSourceImpl());
    gh.factory<_i506.DocumentLocalDataSource>(
        () => _i506.DocumentLocalDataSourceImpl());
    gh.factory<_i701.WorkOrderLocalDataSource>(
        () => _i701.WorkOrderLocalDataSourceImpl(gh<_i459.HiveService>()));
    gh.factory<_i1038.CacheManager>(
        () => _i1038.CacheManager(gh<_i459.HiveService>()));
    gh.singleton<_i379.WorkOrderCompletionCacheService>(
        () => _i379.WorkOrderCompletionCacheService(gh<_i459.HiveService>()));
    gh.factory<_i932.NetworkInfo>(
        () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()));
    gh.factory<_i992.AuthLocalDataSource>(
        () => _i992.AuthLocalDataSourceImpl(gh<_i459.HiveService>()));
    gh.lazySingleton<_i165.IPermissionRepository>(() => permissionModule
        .permissionRepository(gh<_i544.PermissionRemoteDataSource>()));
    gh.factory<_i992.CheckMultiplePermissionStatusUseCase>(() =>
        _i992.CheckMultiplePermissionStatusUseCase(
            gh<_i165.IPermissionRepository>()));
    gh.factory<_i428.CheckPermissionStatusUseCase>(() =>
        _i428.CheckPermissionStatusUseCase(gh<_i165.IPermissionRepository>()));
    gh.factory<_i418.OpenAppSettingsUseCase>(
        () => _i418.OpenAppSettingsUseCase(gh<_i165.IPermissionRepository>()));
    gh.factory<_i804.RequestMultiplePermissionsUseCase>(() =>
        _i804.RequestMultiplePermissionsUseCase(
            gh<_i165.IPermissionRepository>()));
    gh.factory<_i478.RequestPermissionUseCase>(() =>
        _i478.RequestPermissionUseCase(gh<_i165.IPermissionRepository>()));
    gh.factory<_i641.PartsLocalDataSource>(
        () => _i641.PartsLocalDataSourceImpl(gh<_i459.HiveService>()));
    gh.factory<_i530.AuthGuard>(
        () => _i530.AuthGuard(gh<_i992.AuthLocalDataSource>()));
    gh.singleton<_i256.ConnectivityBloc>(() => _i256.ConnectivityBloc(
          gh<_i932.NetworkInfo>(),
          gh<_i895.Connectivity>(),
        ));
    gh.factory<_i993.PermissionBloc>(() => _i993.PermissionBloc(
          gh<_i428.CheckPermissionStatusUseCase>(),
          gh<_i992.CheckMultiplePermissionStatusUseCase>(),
          gh<_i478.RequestPermissionUseCase>(),
          gh<_i804.RequestMultiplePermissionsUseCase>(),
          gh<_i418.OpenAppSettingsUseCase>(),
          gh<_i165.IPermissionRepository>(),
        ));
    gh.factory<_i908.AuthInterceptor>(() => _i908.AuthInterceptor(
          gh<_i992.AuthLocalDataSource>(),
          gh<_i520.LoggingService>(),
        ));
    gh.singleton<_i81.AppRouter>(
        () => _i81.AppRouter(authGuard: gh<_i530.AuthGuard>()));
    gh.factory<_i669.LocationService>(
        () => _i669.LocationService(gh<_i165.IPermissionRepository>()));
    gh.singleton<_i361.Dio>(() => networkModule.provideDio(
          gh<_i908.AuthInterceptor>(),
          gh<_i520.LoggingService>(),
        ));
    gh.singleton<_i538.SyncBloc>(
        () => _i538.SyncBloc(gh<_i256.ConnectivityBloc>()));
    gh.factory<_i541.AuthApiClient>(
        () => authModule.authApiClient(gh<_i361.Dio>()));
    gh.factory<_i584.CalendarApiClient>(
        () => calendarApiModule.calendarApiClient(gh<_i361.Dio>()));
    gh.factory<_i936.DocumentApiClient>(
        () => documentModule.documentApiClient(gh<_i361.Dio>()));
    gh.factory<_i1011.PartsApiClient>(
        () => partsApiModule.partsApiClient(gh<_i361.Dio>()));
    gh.factory<_i751.ProfileApiClient>(
        () => profileApiModule.profileApiClient(gh<_i361.Dio>()));
    gh.factory<_i103.WorkOrderApiClient>(
        () => workOrderApiModule.workOrderApiClient(gh<_i361.Dio>()));
    gh.singleton<_i667.DioClient>(() => _i667.DioClient(gh<_i361.Dio>()));
    gh.factory<_i161.AuthRemoteDataSource>(
        () => _i161.AuthRemoteDataSourceImpl(gh<_i541.AuthApiClient>()));
    gh.factory<_i589.IAuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i161.AuthRemoteDataSource>(),
          gh<_i992.AuthLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i255.WorkOrderRemoteDataSource>(() =>
        _i255.WorkOrderRemoteDataSourceImpl(gh<_i103.WorkOrderApiClient>()));
    gh.factory<_i123.CalendarRemoteDataSource>(() =>
        _i123.CalendarRemoteDataSourceImpl(gh<_i584.CalendarApiClient>()));
    gh.factory<_i749.DocumentRemoteDataSource>(() =>
        _i749.DocumentRemoteDataSourceImpl(gh<_i936.DocumentApiClient>()));
    gh.factory<_i831.CheckAuthUseCase>(
        () => _i831.CheckAuthUseCase(gh<_i589.IAuthRepository>()));
    gh.factory<_i188.LoginUseCase>(
        () => _i188.LoginUseCase(gh<_i589.IAuthRepository>()));
    gh.factory<_i48.LogoutUseCase>(
        () => _i48.LogoutUseCase(gh<_i589.IAuthRepository>()));
    gh.factory<_i157.RefreshTokenUseCase>(
        () => _i157.RefreshTokenUseCase(gh<_i589.IAuthRepository>()));
    gh.factory<_i327.ProfileRemoteDataSource>(
        () => _i327.ProfileRemoteDataSourceImpl(gh<_i751.ProfileApiClient>()));
    gh.factory<_i747.PartsRemoteDataSource>(
        () => _i747.PartsRemoteDataSourceImpl(gh<_i1011.PartsApiClient>()));
    gh.factory<_i342.ICalendarRepository>(() => _i712.CalendarRepositoryImpl(
          gh<_i123.CalendarRemoteDataSource>(),
          gh<_i494.CalendarLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i556.IWorkOrderRepository>(() => _i937.WorkOrderRepositoryImpl(
          gh<_i255.WorkOrderRemoteDataSource>(),
          gh<_i701.WorkOrderLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
          gh<_i520.LoggingService>(),
        ));
    gh.singleton<_i331.AuthBloc>(() => _i331.AuthBloc(
          gh<_i188.LoginUseCase>(),
          gh<_i48.LogoutUseCase>(),
          gh<_i831.CheckAuthUseCase>(),
          gh<_i157.RefreshTokenUseCase>(),
        ));
    gh.factory<_i490.IPartsRepository>(() => _i644.PartsRepositoryImpl(
          gh<_i747.PartsRemoteDataSource>(),
          gh<_i641.PartsLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i121.IDocumentRepository>(() => _i113.DocumentRepositoryImpl(
          gh<_i749.DocumentRemoteDataSource>(),
          gh<_i506.DocumentLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i377.GetCalendarEventsUseCase>(
        () => _i377.GetCalendarEventsUseCase(gh<_i342.ICalendarRepository>()));
    gh.factory<_i614.GetDailyScheduleUseCase>(
        () => _i614.GetDailyScheduleUseCase(gh<_i342.ICalendarRepository>()));
    gh.factory<_i316.OptimizeRouteUseCase>(
        () => _i316.OptimizeRouteUseCase(gh<_i342.ICalendarRepository>()));
    gh.factory<_i139.CalendarBloc>(() => _i139.CalendarBloc(
          gh<_i377.GetCalendarEventsUseCase>(),
          gh<_i614.GetDailyScheduleUseCase>(),
          gh<_i316.OptimizeRouteUseCase>(),
          gh<_i342.ICalendarRepository>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i879.IProfileRepository>(() => _i334.ProfileRepositoryImpl(
          gh<_i327.ProfileRemoteDataSource>(),
          gh<_i1046.ProfileLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i460.CompleteWorkOrderUseCase>(
        () => _i460.CompleteWorkOrderUseCase(gh<_i556.IWorkOrderRepository>()));
    gh.factory<_i874.GetWorkOrdersUseCase>(
        () => _i874.GetWorkOrdersUseCase(gh<_i556.IWorkOrderRepository>()));
    gh.factory<_i1023.GetWorkOrderDetailsUseCase>(() =>
        _i1023.GetWorkOrderDetailsUseCase(gh<_i556.IWorkOrderRepository>()));
    gh.factory<_i959.PauseWorkOrderUseCase>(
        () => _i959.PauseWorkOrderUseCase(gh<_i556.IWorkOrderRepository>()));
    gh.factory<_i310.RejectWorkOrderUseCase>(
        () => _i310.RejectWorkOrderUseCase(gh<_i556.IWorkOrderRepository>()));
    gh.factory<_i489.ResumeWorkOrderUseCase>(
        () => _i489.ResumeWorkOrderUseCase(gh<_i556.IWorkOrderRepository>()));
    gh.factory<_i188.StartWorkOrderUseCase>(
        () => _i188.StartWorkOrderUseCase(gh<_i556.IWorkOrderRepository>()));
    gh.factory<_i1036.CheckPartAvailabilityUseCase>(() =>
        _i1036.CheckPartAvailabilityUseCase(gh<_i490.IPartsRepository>()));
    gh.factory<_i1054.GetLowStockPartsUseCase>(
        () => _i1054.GetLowStockPartsUseCase(gh<_i490.IPartsRepository>()));
    gh.factory<_i637.GetPartsUseCase>(
        () => _i637.GetPartsUseCase(gh<_i490.IPartsRepository>()));
    gh.factory<_i170.SearchPartsUseCase>(
        () => _i170.SearchPartsUseCase(gh<_i490.IPartsRepository>()));
    gh.factory<_i344.PartsBloc>(() => _i344.PartsBloc(
          gh<_i637.GetPartsUseCase>(),
          gh<_i170.SearchPartsUseCase>(),
          gh<_i1054.GetLowStockPartsUseCase>(),
          gh<_i490.IPartsRepository>(),
        ));
    gh.factory<_i750.DownloadDocumentUseCase>(
        () => _i750.DownloadDocumentUseCase(gh<_i121.IDocumentRepository>()));
    gh.factory<_i911.GetDocumentsUseCase>(
        () => _i911.GetDocumentsUseCase(gh<_i121.IDocumentRepository>()));
    gh.factory<_i937.GetDocumentByIdUseCase>(
        () => _i937.GetDocumentByIdUseCase(gh<_i121.IDocumentRepository>()));
    gh.factory<_i1041.GetDocumentCategoriesUseCase>(() =>
        _i1041.GetDocumentCategoriesUseCase(gh<_i121.IDocumentRepository>()));
    gh.factory<_i633.SearchDocumentsUseCase>(
        () => _i633.SearchDocumentsUseCase(gh<_i121.IDocumentRepository>()));
    gh.factory<_i81.DashboardBloc>(() => _i81.DashboardBloc(
          gh<_i874.GetWorkOrdersUseCase>(),
          gh<_i556.IWorkOrderRepository>(),
          gh<_i589.IAuthRepository>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i332.WorkOrdersListBloc>(() => _i332.WorkOrdersListBloc(
          gh<_i874.GetWorkOrdersUseCase>(),
          gh<_i556.IWorkOrderRepository>(),
          gh<_i589.IAuthRepository>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i239.DocumentsBloc>(() => _i239.DocumentsBloc(
          gh<_i911.GetDocumentsUseCase>(),
          gh<_i633.SearchDocumentsUseCase>(),
          gh<_i750.DownloadDocumentUseCase>(),
          gh<_i1041.GetDocumentCategoriesUseCase>(),
          gh<_i121.IDocumentRepository>(),
        ));
    gh.factory<_i154.GetPreferencesUseCase>(
        () => _i154.GetPreferencesUseCase(gh<_i879.IProfileRepository>()));
    gh.factory<_i965.GetProfileUseCase>(
        () => _i965.GetProfileUseCase(gh<_i879.IProfileRepository>()));
    gh.factory<_i17.LogoutUseCase>(
        () => _i17.LogoutUseCase(gh<_i879.IProfileRepository>()));
    gh.factory<_i90.UpdatePreferencesUseCase>(
        () => _i90.UpdatePreferencesUseCase(gh<_i879.IProfileRepository>()));
    gh.factory<_i478.UpdateProfileUseCase>(
        () => _i478.UpdateProfileUseCase(gh<_i879.IProfileRepository>()));
    gh.factory<_i532.WorkOrderActionBloc>(() => _i532.WorkOrderActionBloc(
          gh<_i1023.GetWorkOrderDetailsUseCase>(),
          gh<_i188.StartWorkOrderUseCase>(),
          gh<_i959.PauseWorkOrderUseCase>(),
          gh<_i489.ResumeWorkOrderUseCase>(),
          gh<_i460.CompleteWorkOrderUseCase>(),
          gh<_i310.RejectWorkOrderUseCase>(),
          gh<_i669.LocationService>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i349.ProfileBloc>(() => _i349.ProfileBloc(
          gh<_i965.GetProfileUseCase>(),
          gh<_i478.UpdateProfileUseCase>(),
          gh<_i154.GetPreferencesUseCase>(),
          gh<_i90.UpdatePreferencesUseCase>(),
          gh<_i17.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$ConnectivityModule extends _i932.ConnectivityModule {}

class _$PermissionModule extends _i469.PermissionModule {}

class _$NetworkModule extends _i667.NetworkModule {}

class _$AuthModule extends _i521.AuthModule {}

class _$CalendarApiModule extends _i347.CalendarApiModule {}

class _$DocumentModule extends _i843.DocumentModule {}

class _$PartsApiModule extends _i33.PartsApiModule {}

class _$ProfileApiModule extends _i862.ProfileApiModule {}

class _$WorkOrderApiModule extends _i860.WorkOrderApiModule {}
