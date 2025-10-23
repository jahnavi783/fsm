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
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final connectivityModule = _$ConnectivityModule();
    final permissionModule = _$PermissionModule();
    final networkModule = _$NetworkModule();
    final calendarApiModule = _$CalendarApiModule();
    final authModule = _$AuthModule();
    final profileApiModule = _$ProfileApiModule();
    final workOrderApiModule = _$WorkOrderApiModule();
    final partsApiModule = _$PartsApiModule();
    final documentModule = _$DocumentModule();
    gh.factory<_i895.Connectivity>(() => connectivityModule.connectivity);
    gh.factory<_i465.NavigationBloc>(() => _i465.NavigationBloc());
    gh.factory<_i544.PermissionRemoteDataSource>(
        () => _i544.PermissionRemoteDataSource());
    gh.singletonAsync<_i459.HiveService>(() => _i459.HiveService.create());
    gh.singleton<_i600.ErrorBoundaryService>(
        () => _i600.ErrorBoundaryService());
    gh.singleton<_i870.LazyLoadingService>(() => _i870.LazyLoadingService());
    gh.singleton<_i1066.MemoryManagementService>(
        () => _i1066.MemoryManagementService());
    gh.singleton<_i910.PerformanceService>(() => _i910.PerformanceService());
    gh.singleton<_i520.LoggingService>(() => _i520.LoggingService());
    gh.singleton<_i188.ErrorBloc>(
        () => _i188.ErrorBloc(gh<_i520.LoggingService>()));
    gh.factory<_i1046.ProfileLocalDataSource>(
        () => _i1046.ProfileLocalDataSourceImpl());
    gh.factory<_i494.CalendarLocalDataSource>(
        () => _i494.CalendarLocalDataSourceImpl());
    gh.factory<_i506.DocumentLocalDataSource>(
        () => _i506.DocumentLocalDataSourceImpl());
    gh.factoryAsync<_i701.WorkOrderLocalDataSource>(() async =>
        _i701.WorkOrderLocalDataSourceImpl(
            await getAsync<_i459.HiveService>()));
    gh.factoryAsync<_i1038.CacheManager>(
        () async => _i1038.CacheManager(await getAsync<_i459.HiveService>()));
    gh.factory<_i932.NetworkInfo>(
        () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()));
    gh.factoryAsync<_i992.AuthLocalDataSource>(() async =>
        _i992.AuthLocalDataSourceImpl(await getAsync<_i459.HiveService>()));
    gh.lazySingleton<_i165.IPermissionRepository>(() => permissionModule
        .permissionRepository(gh<_i544.PermissionRemoteDataSource>()));
    gh.factory<_i418.OpenAppSettingsUseCase>(
        () => _i418.OpenAppSettingsUseCase(gh<_i165.IPermissionRepository>()));
    gh.factory<_i478.RequestPermissionUseCase>(() =>
        _i478.RequestPermissionUseCase(gh<_i165.IPermissionRepository>()));
    gh.factory<_i804.RequestMultiplePermissionsUseCase>(() =>
        _i804.RequestMultiplePermissionsUseCase(
            gh<_i165.IPermissionRepository>()));
    gh.factory<_i992.CheckMultiplePermissionStatusUseCase>(() =>
        _i992.CheckMultiplePermissionStatusUseCase(
            gh<_i165.IPermissionRepository>()));
    gh.factory<_i428.CheckPermissionStatusUseCase>(() =>
        _i428.CheckPermissionStatusUseCase(gh<_i165.IPermissionRepository>()));
    gh.factoryAsync<_i641.PartsLocalDataSource>(() async =>
        _i641.PartsLocalDataSourceImpl(await getAsync<_i459.HiveService>()));
    gh.factoryAsync<_i530.AuthGuard>(() async =>
        _i530.AuthGuard(await getAsync<_i992.AuthLocalDataSource>()));
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
    gh.factoryAsync<_i908.AuthInterceptor>(() async => _i908.AuthInterceptor(
          await getAsync<_i992.AuthLocalDataSource>(),
          gh<_i520.LoggingService>(),
        ));
    gh.singletonAsync<_i81.AppRouter>(() async =>
        _i81.AppRouter(authGuard: await getAsync<_i530.AuthGuard>()));
    gh.factory<_i669.LocationService>(
        () => _i669.LocationService(gh<_i165.IPermissionRepository>()));
    gh.singletonAsync<_i361.Dio>(() async => networkModule.provideDio(
          await getAsync<_i908.AuthInterceptor>(),
          gh<_i520.LoggingService>(),
        ));
    gh.singleton<_i538.SyncBloc>(
        () => _i538.SyncBloc(gh<_i256.ConnectivityBloc>()));
    gh.factoryAsync<_i584.CalendarApiClient>(() async =>
        calendarApiModule.calendarApiClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i541.AuthApiClient>(
        () async => authModule.authApiClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i751.ProfileApiClient>(() async =>
        profileApiModule.profileApiClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i103.WorkOrderApiClient>(() async =>
        workOrderApiModule.workOrderApiClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i1011.PartsApiClient>(
        () async => partsApiModule.partsApiClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i936.DocumentApiClient>(() async =>
        documentModule.documentApiClient(await getAsync<_i361.Dio>()));
    gh.singletonAsync<_i667.DioClient>(
        () async => _i667.DioClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i161.AuthRemoteDataSource>(() async =>
        _i161.AuthRemoteDataSourceImpl(await getAsync<_i541.AuthApiClient>()));
    gh.factoryAsync<_i589.IAuthRepository>(() async => _i153.AuthRepositoryImpl(
          await getAsync<_i161.AuthRemoteDataSource>(),
          await getAsync<_i992.AuthLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factoryAsync<_i255.WorkOrderRemoteDataSource>(() async =>
        _i255.WorkOrderRemoteDataSourceImpl(
            await getAsync<_i103.WorkOrderApiClient>()));
    gh.factoryAsync<_i123.CalendarRemoteDataSource>(() async =>
        _i123.CalendarRemoteDataSourceImpl(
            await getAsync<_i584.CalendarApiClient>()));
    gh.factoryAsync<_i749.DocumentRemoteDataSource>(() async =>
        _i749.DocumentRemoteDataSourceImpl(
            await getAsync<_i936.DocumentApiClient>()));
    gh.factoryAsync<_i831.CheckAuthUseCase>(() async =>
        _i831.CheckAuthUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i157.RefreshTokenUseCase>(() async =>
        _i157.RefreshTokenUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i188.LoginUseCase>(() async =>
        _i188.LoginUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i48.LogoutUseCase>(() async =>
        _i48.LogoutUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i327.ProfileRemoteDataSource>(() async =>
        _i327.ProfileRemoteDataSourceImpl(
            await getAsync<_i751.ProfileApiClient>()));
    gh.factoryAsync<_i747.PartsRemoteDataSource>(() async =>
        _i747.PartsRemoteDataSourceImpl(
            await getAsync<_i1011.PartsApiClient>()));
    gh.factoryAsync<_i342.ICalendarRepository>(
        () async => _i712.CalendarRepositoryImpl(
              await getAsync<_i123.CalendarRemoteDataSource>(),
              gh<_i494.CalendarLocalDataSource>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.factoryAsync<_i556.IWorkOrderRepository>(
        () async => _i937.WorkOrderRepositoryImpl(
              await getAsync<_i255.WorkOrderRemoteDataSource>(),
              await getAsync<_i701.WorkOrderLocalDataSource>(),
              gh<_i932.NetworkInfo>(),
              gh<_i520.LoggingService>(),
            ));
    gh.singletonAsync<_i331.AuthBloc>(() async => _i331.AuthBloc(
          await getAsync<_i188.LoginUseCase>(),
          await getAsync<_i48.LogoutUseCase>(),
          await getAsync<_i831.CheckAuthUseCase>(),
          await getAsync<_i157.RefreshTokenUseCase>(),
        ));
    gh.factoryAsync<_i490.IPartsRepository>(
        () async => _i644.PartsRepositoryImpl(
              await getAsync<_i747.PartsRemoteDataSource>(),
              await getAsync<_i641.PartsLocalDataSource>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.factoryAsync<_i121.IDocumentRepository>(
        () async => _i113.DocumentRepositoryImpl(
              await getAsync<_i749.DocumentRemoteDataSource>(),
              gh<_i506.DocumentLocalDataSource>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.factoryAsync<_i614.GetDailyScheduleUseCase>(() async =>
        _i614.GetDailyScheduleUseCase(
            await getAsync<_i342.ICalendarRepository>()));
    gh.factoryAsync<_i377.GetCalendarEventsUseCase>(() async =>
        _i377.GetCalendarEventsUseCase(
            await getAsync<_i342.ICalendarRepository>()));
    gh.factoryAsync<_i316.OptimizeRouteUseCase>(() async =>
        _i316.OptimizeRouteUseCase(
            await getAsync<_i342.ICalendarRepository>()));
    gh.factoryAsync<_i139.CalendarBloc>(() async => _i139.CalendarBloc(
          await getAsync<_i377.GetCalendarEventsUseCase>(),
          await getAsync<_i614.GetDailyScheduleUseCase>(),
          await getAsync<_i316.OptimizeRouteUseCase>(),
          await getAsync<_i342.ICalendarRepository>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factoryAsync<_i879.IProfileRepository>(
        () async => _i334.ProfileRepositoryImpl(
              await getAsync<_i327.ProfileRemoteDataSource>(),
              gh<_i1046.ProfileLocalDataSource>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.factoryAsync<_i188.StartWorkOrderUseCase>(() async =>
        _i188.StartWorkOrderUseCase(
            await getAsync<_i556.IWorkOrderRepository>()));
    gh.factoryAsync<_i489.ResumeWorkOrderUseCase>(() async =>
        _i489.ResumeWorkOrderUseCase(
            await getAsync<_i556.IWorkOrderRepository>()));
    gh.factoryAsync<_i460.CompleteWorkOrderUseCase>(() async =>
        _i460.CompleteWorkOrderUseCase(
            await getAsync<_i556.IWorkOrderRepository>()));
    gh.factoryAsync<_i959.PauseWorkOrderUseCase>(() async =>
        _i959.PauseWorkOrderUseCase(
            await getAsync<_i556.IWorkOrderRepository>()));
    gh.factoryAsync<_i874.GetWorkOrdersUseCase>(() async =>
        _i874.GetWorkOrdersUseCase(
            await getAsync<_i556.IWorkOrderRepository>()));
    gh.factoryAsync<_i1023.GetWorkOrderDetailsUseCase>(() async =>
        _i1023.GetWorkOrderDetailsUseCase(
            await getAsync<_i556.IWorkOrderRepository>()));
    gh.factoryAsync<_i310.RejectWorkOrderUseCase>(() async =>
        _i310.RejectWorkOrderUseCase(
            await getAsync<_i556.IWorkOrderRepository>()));
    gh.factoryAsync<_i1036.CheckPartAvailabilityUseCase>(() async =>
        _i1036.CheckPartAvailabilityUseCase(
            await getAsync<_i490.IPartsRepository>()));
    gh.factoryAsync<_i1054.GetLowStockPartsUseCase>(() async =>
        _i1054.GetLowStockPartsUseCase(
            await getAsync<_i490.IPartsRepository>()));
    gh.factoryAsync<_i170.SearchPartsUseCase>(() async =>
        _i170.SearchPartsUseCase(await getAsync<_i490.IPartsRepository>()));
    gh.factoryAsync<_i637.GetPartsUseCase>(() async =>
        _i637.GetPartsUseCase(await getAsync<_i490.IPartsRepository>()));
    gh.factoryAsync<_i344.PartsBloc>(() async => _i344.PartsBloc(
          await getAsync<_i637.GetPartsUseCase>(),
          await getAsync<_i170.SearchPartsUseCase>(),
          await getAsync<_i1054.GetLowStockPartsUseCase>(),
          await getAsync<_i490.IPartsRepository>(),
        ));
    gh.factoryAsync<_i1041.GetDocumentCategoriesUseCase>(() async =>
        _i1041.GetDocumentCategoriesUseCase(
            await getAsync<_i121.IDocumentRepository>()));
    gh.factoryAsync<_i633.SearchDocumentsUseCase>(() async =>
        _i633.SearchDocumentsUseCase(
            await getAsync<_i121.IDocumentRepository>()));
    gh.factoryAsync<_i937.GetDocumentByIdUseCase>(() async =>
        _i937.GetDocumentByIdUseCase(
            await getAsync<_i121.IDocumentRepository>()));
    gh.factoryAsync<_i911.GetDocumentsUseCase>(() async =>
        _i911.GetDocumentsUseCase(await getAsync<_i121.IDocumentRepository>()));
    gh.factoryAsync<_i750.DownloadDocumentUseCase>(() async =>
        _i750.DownloadDocumentUseCase(
            await getAsync<_i121.IDocumentRepository>()));
    gh.factoryAsync<_i332.WorkOrdersListBloc>(
        () async => _i332.WorkOrdersListBloc(
              await getAsync<_i874.GetWorkOrdersUseCase>(),
              await getAsync<_i556.IWorkOrderRepository>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.factoryAsync<_i239.DocumentsBloc>(() async => _i239.DocumentsBloc(
          await getAsync<_i911.GetDocumentsUseCase>(),
          await getAsync<_i633.SearchDocumentsUseCase>(),
          await getAsync<_i750.DownloadDocumentUseCase>(),
          await getAsync<_i1041.GetDocumentCategoriesUseCase>(),
          await getAsync<_i121.IDocumentRepository>(),
        ));
    gh.factoryAsync<_i478.UpdateProfileUseCase>(() async =>
        _i478.UpdateProfileUseCase(await getAsync<_i879.IProfileRepository>()));
    gh.factoryAsync<_i17.LogoutUseCase>(() async =>
        _i17.LogoutUseCase(await getAsync<_i879.IProfileRepository>()));
    gh.factoryAsync<_i154.GetPreferencesUseCase>(() async =>
        _i154.GetPreferencesUseCase(
            await getAsync<_i879.IProfileRepository>()));
    gh.factoryAsync<_i965.GetProfileUseCase>(() async =>
        _i965.GetProfileUseCase(await getAsync<_i879.IProfileRepository>()));
    gh.factoryAsync<_i90.UpdatePreferencesUseCase>(() async =>
        _i90.UpdatePreferencesUseCase(
            await getAsync<_i879.IProfileRepository>()));
    gh.factoryAsync<_i532.WorkOrderActionBloc>(
        () async => _i532.WorkOrderActionBloc(
              await getAsync<_i1023.GetWorkOrderDetailsUseCase>(),
              await getAsync<_i188.StartWorkOrderUseCase>(),
              await getAsync<_i959.PauseWorkOrderUseCase>(),
              await getAsync<_i489.ResumeWorkOrderUseCase>(),
              await getAsync<_i460.CompleteWorkOrderUseCase>(),
              await getAsync<_i310.RejectWorkOrderUseCase>(),
              gh<_i669.LocationService>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.factoryAsync<_i349.ProfileBloc>(() async => _i349.ProfileBloc(
          await getAsync<_i965.GetProfileUseCase>(),
          await getAsync<_i478.UpdateProfileUseCase>(),
          await getAsync<_i154.GetPreferencesUseCase>(),
          await getAsync<_i90.UpdatePreferencesUseCase>(),
          await getAsync<_i17.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$ConnectivityModule extends _i932.ConnectivityModule {}

class _$PermissionModule extends _i469.PermissionModule {}

class _$NetworkModule extends _i667.NetworkModule {}

class _$CalendarApiModule extends _i347.CalendarApiModule {}

class _$AuthModule extends _i521.AuthModule {}

class _$ProfileApiModule extends _i862.ProfileApiModule {}

class _$WorkOrderApiModule extends _i860.WorkOrderApiModule {}

class _$PartsApiModule extends _i33.PartsApiModule {}

class _$DocumentModule extends _i843.DocumentModule {}
