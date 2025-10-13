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
import '../network/auth_interceptor.dart' as _i908;
import '../network/dio_client.dart' as _i667;
import '../network/network_info.dart' as _i932;
import '../router/app_router.dart' as _i81;
import '../services/location_service.dart' as _i669;
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
    final networkModule = _$NetworkModule();
    final authModule = _$AuthModule();
    final workOrderApiModule = _$WorkOrderApiModule();
    final documentModule = _$DocumentModule();
    gh.factory<_i895.Connectivity>(() => connectivityModule.connectivity);
    gh.factory<_i669.LocationService>(() => _i669.LocationService());
    gh.singletonAsync<_i459.HiveService>(() => _i459.HiveService.create());
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
    gh.factoryAsync<_i908.AuthInterceptor>(() async =>
        _i908.AuthInterceptor(await getAsync<_i992.AuthLocalDataSource>()));
    gh.factoryAsync<_i81.AuthGuard>(() async =>
        _i81.AuthGuard(await getAsync<_i992.AuthLocalDataSource>()));
    gh.singletonAsync<_i361.Dio>(() async =>
        networkModule.provideDio(await getAsync<_i908.AuthInterceptor>()));
    gh.factoryAsync<_i541.AuthApiClient>(
        () async => authModule.authApiClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i103.WorkOrderApiClient>(() async =>
        workOrderApiModule.workOrderApiClient(await getAsync<_i361.Dio>()));
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
    gh.factoryAsync<_i556.IWorkOrderRepository>(
        () async => _i937.WorkOrderRepositoryImpl(
              await getAsync<_i255.WorkOrderRemoteDataSource>(),
              await getAsync<_i701.WorkOrderLocalDataSource>(),
              gh<_i932.NetworkInfo>(),
            ));
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
    gh.factoryAsync<_i331.AuthBloc>(() async => _i331.AuthBloc(
          await getAsync<_i188.LoginUseCase>(),
          await getAsync<_i48.LogoutUseCase>(),
          await getAsync<_i831.CheckAuthUseCase>(),
          await getAsync<_i157.RefreshTokenUseCase>(),
        ));
    gh.factoryAsync<_i332.WorkOrdersListBloc>(
        () async => _i332.WorkOrdersListBloc(
              await getAsync<_i874.GetWorkOrdersUseCase>(),
              await getAsync<_i556.IWorkOrderRepository>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.factoryAsync<_i121.IDocumentRepository>(
        () async => _i113.DocumentRepositoryImpl(
              await getAsync<_i749.DocumentRemoteDataSource>(),
              gh<_i506.DocumentLocalDataSource>(),
              gh<_i932.NetworkInfo>(),
            ));
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
    gh.factoryAsync<_i239.DocumentsBloc>(() async => _i239.DocumentsBloc(
          await getAsync<_i911.GetDocumentsUseCase>(),
          await getAsync<_i633.SearchDocumentsUseCase>(),
          await getAsync<_i750.DownloadDocumentUseCase>(),
          await getAsync<_i1041.GetDocumentCategoriesUseCase>(),
          await getAsync<_i121.IDocumentRepository>(),
        ));
    return this;
  }
}

class _$ConnectivityModule extends _i932.ConnectivityModule {}

class _$NetworkModule extends _i667.NetworkModule {}

class _$AuthModule extends _i521.AuthModule {}

class _$WorkOrderApiModule extends _i860.WorkOrderApiModule {}

class _$DocumentModule extends _i843.DocumentModule {}
