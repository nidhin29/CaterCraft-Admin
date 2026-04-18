import 'package:catering/Domain/LoggedIn/logged_in_service.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LoggedInService)
class LoggedInRepo implements LoggedInService {
  final Dio _dio;
  final TokenService _tokenService;

  LoggedInRepo(this._dio, this._tokenService);

  @override
  Future<bool> isLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    final email = sharedPref.getString('email');
    return email != null;
  }

  @override
  Future<bool> isOnboarded() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool('is_onboarded') ?? false;
  }

  @override
  Future<bool> validateSession() async {
    try {
      final response = await _dio.get('api/v1/auth/validate-token');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> refreshTokens() async {
    try {
      final refreshToken = await _tokenService.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await _dio.post(
        'api/v1/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final accessToken = response.data['data']['accessToken'];
        final newRefreshToken = response.data['data']['refreshToken'];
        
        await _tokenService.saveToken(accessToken);
        await _tokenService.saveRefreshToken(newRefreshToken);
        
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
