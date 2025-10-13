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
    gh.factory<_i895.Connectivity>(() => connectivityModule.connectivity);
    gh.factory<_i669.LocationService>(() => _i669.LocationService());
    gh.singletonAsync<_i459.HiveService>(() => _i459.HiveService.create());
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
    gh.singletonAsync<_i667.DioClient>(
        () async => _i667.DioClient(await getAsync<_i361.Dio>()));
    gh.factoryAsync<_i161.AuthRemoteDataSource>(() async =>
        _i161.AuthRemoteDataSourceImpl(await getAsync<_i541.AuthApiClient>()));
    gh.factoryAsync<_i589.IAuthRepository>(() async => _i153.AuthRepositoryImpl(
          await getAsync<_i161.AuthRemoteDataSource>(),
          await getAsync<_i992.AuthLocalDataSource>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factoryAsync<_i831.CheckAuthUseCase>(() async =>
        _i831.CheckAuthUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i157.RefreshTokenUseCase>(() async =>
        _i157.RefreshTokenUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i188.LoginUseCase>(() async =>
        _i188.LoginUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i48.LogoutUseCase>(() async =>
        _i48.LogoutUseCase(await getAsync<_i589.IAuthRepository>()));
    gh.factoryAsync<_i331.AuthBloc>(() async => _i331.AuthBloc(
          await getAsync<_i188.LoginUseCase>(),
          await getAsync<_i48.LogoutUseCase>(),
          await getAsync<_i831.CheckAuthUseCase>(),
          await getAsync<_i157.RefreshTokenUseCase>(),
        ));
    return this;
  }
}

class _$ConnectivityModule extends _i932.ConnectivityModule {}

class _$NetworkModule extends _i667.NetworkModule {}

class _$AuthModule extends _i521.AuthModule {}
