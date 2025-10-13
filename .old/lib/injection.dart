import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart'
    show RetryInterceptor, status401Unauthorized;
import 'package:fsm_flutter/core/auth_interceptor.dart';
import 'package:fsm_flutter/core/services/location_service.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  // Register HTTP Client as a Singleton
  serviceLocator.registerLazySingleton<http.Client>(() => http.Client());
  final prefs = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(() => prefs);
  final dio = Dio();
  serviceLocator.registerLazySingleton<Dio>(() => dio);
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  ));
  dio.interceptors.add(ChuckerDioInterceptor());
  final authInterceptor = AuthInterceptor(serviceLocator<Dio>());
  serviceLocator.registerLazySingleton<AuthInterceptor>(() => authInterceptor);
  dio.interceptors.add(authInterceptor);
  dio.interceptors.add(RetryInterceptor(
    dio: dio,
    retryableExtraStatuses: {status401Unauthorized},
  ));

  serviceLocator.registerLazySingleton<RestClient>(
      () => RestClient(serviceLocator<Dio>()));

  serviceLocator
      .registerLazySingleton<LocationService>(() => LocationService());
}
