abstract class TokenService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<void> saveRole(int role);
  Future<int?> getRole();
  Future<void> saveEmail(String email);
  Future<String?> getEmail();
  Future<void> clearAll();
}
