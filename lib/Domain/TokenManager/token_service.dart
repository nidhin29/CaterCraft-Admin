abstract class TokenService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> deleteToken();
  Future<void> saveRole(int role);
  Future<int?> getRole();
  Future<void> saveEmail(String email);
  Future<String?> getEmail();
  Future<void> saveCompanyName(String name);
  Future<String?> getCompanyName();
  Future<void> saveCompanyLogo(String url);
  Future<String?> getCompanyLogo();
  Future<void> saveVerificationStatus(String status);
  Future<String?> getVerificationStatus();
  Future<void> saveUsername(String username);
  Future<String?> getUsername();
  Future<void> savePasswordUpdated(bool status);
  Future<bool> getPasswordUpdated();
  Future<void> clearAll();
}
