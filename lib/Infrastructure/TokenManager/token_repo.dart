import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@LazySingleton(as: TokenService)
class TokenRepo implements TokenService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';
  static const String _roleKey = 'user_role';
  static const String _emailKey = 'user_email';

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  @override
  Future<void> saveRole(int role) async {
    await _storage.write(key: _roleKey, value: role.toString());
  }

  @override
  Future<int?> getRole() async {
    final roleStr = await _storage.read(key: _roleKey);
    return roleStr != null ? int.tryParse(roleStr) : null;
  }

  @override
  Future<void> saveEmail(String email) async {
    await _storage.write(key: _emailKey, value: email);
  }

  @override
  Future<String?> getEmail() async {
    return await _storage.read(key: _emailKey);
  }

  @override
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
