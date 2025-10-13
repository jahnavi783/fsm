// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:fsm/core/network/auth_interceptor.dart' as _i229;
import 'package:fsm/core/network/dio_client.dart' as _i247;
import 'package:fsm/core/network/network_info.dart' as _i653;
import 'package:fsm/core/services/location_service.dart' as _i688;
import 'package:fsm/core/storage/cache_manager.dart' as _i523;
import 'package:fsm/core/storage/hive_service.dart' as _i796;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final networkModule = _$NetworkModule();
    gh.factory<_i895.Connectivity>(() => networkModule.connectivity);
    gh.factory<_i688.LocationService>(() => _i688.LocationService());
    gh.singletonAsync<_i796.HiveService>(() => _i796.HiveService.create());
    gh.factoryAsync<_i229.AuthInterceptor>(
        () async => _i229.AuthInterceptor(await getAsync<_i796.HiveService>()));
    gh.factoryAsync<_i523.CacheManager>(
        () async => _i523.CacheManager(await getAsync<_i796.HiveService>()));
    gh.factory<_i653.NetworkInfo>(
        () => _i653.NetworkInfoImpl(gh<_i895.Connectivity>()));
    gh.singletonAsync<_i247.DioClient>(
        () async => _i247.DioClient(await getAsync<_i229.AuthInterceptor>()));
    return this;
  }
}

class _$NetworkModule extends _i653.NetworkModule {}
