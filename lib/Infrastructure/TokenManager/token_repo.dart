import 'dart:developer';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: TokenService)
class TokenRepo implements TokenService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final SharedPreferences _prefs;

  // Static cache for the role to ensure zero-latency retrieval during routing
  static int? _cachedRole;

  TokenRepo(this._prefs) {
    // Initial sync from prefs
    _cachedRole = _prefs.getInt(_roleKey);
  }

  static const String _tokenKey = 'auth_token';
  static const String _roleKey = 'user_role';
  static const String _emailKey = 'user_email';
  static const String _companyKey = 'user_company';
  static const String _logoKey = 'user_logo';
  static const String _statusKey = 'user_status';
  static const String _usernameKey = 'user_username';
  static const String _passwordUpdatedKey = 'user_password_updated';

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<void> saveRole(int role) async {
    log('DEBUG: TokenRepo.saveRole (Atomic) - Saving role: $role');
    _cachedRole = role; // Update cache immediately
    await _prefs.setInt(_roleKey, role);
  }

  @override
  Future<int?> getRole() async {
    // Priority 1: In-memory cache
    if (_cachedRole != null) {
      return _cachedRole;
    }
    
    // Priority 2: Persistent storage
    final role = _prefs.getInt(_roleKey);
    _cachedRole = role; // Re-sync cache
    return role;
  }

  @override
  Future<void> saveEmail(String email) async {
    await _prefs.setString(_emailKey, email);
  }

  @override
  Future<String?> getEmail() async {
    return _prefs.getString(_emailKey);
  }

  @override
  Future<void> saveCompanyName(String name) async {
    await _prefs.setString(_companyKey, name);
  }

  @override
  Future<String?> getCompanyName() async {
    return _prefs.getString(_companyKey);
  }

  @override
  Future<void> saveCompanyLogo(String url) async {
    await _prefs.setString(_logoKey, url);
  }

  @override
  Future<String?> getCompanyLogo() async {
    return _prefs.getString(_logoKey);
  }

  @override
  Future<void> saveVerificationStatus(String status) async {
    await _prefs.setString(_statusKey, status);
  }

  @override
  Future<String?> getVerificationStatus() async {
    return _prefs.getString(_statusKey);
  }

  @override
  Future<void> saveUsername(String username) async {
    await _prefs.setString(_usernameKey, username);
  }

  @override
  Future<String?> getUsername() async {
    return _prefs.getString(_usernameKey);
  }

  @override
  Future<void> savePasswordUpdated(bool status) async {
    final email = await getEmail();
    if (email != null) {
      await _prefs.setBool('${_passwordUpdatedKey}_$email', status);
    }
  }

  @override
  Future<bool> getPasswordUpdated() async {
    final email = await getEmail();
    if (email != null) {
      return _prefs.getBool('${_passwordUpdatedKey}_$email') ?? false;
    }
    return false;
  }

  @override
  Future<void> clearAll() async {
    _cachedRole = null; // Clear cache
    await _secureStorage.delete(key: _tokenKey);
    await _prefs.remove(_roleKey);
    await _prefs.remove(_emailKey);
    await _prefs.remove(_companyKey);
    await _prefs.remove(_logoKey);
    await _prefs.remove(_statusKey);
    await _prefs.remove(_usernameKey);
    // Explicitly NOT calling _prefs.clear() to preserve historical flags like password updates across logins
  }
}
