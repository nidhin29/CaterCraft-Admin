import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:catering/constants/const.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:catering/core/injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final tokenService = getIt<TokenService>();
        final token = await tokenService.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));

    return dio;
  }
}
