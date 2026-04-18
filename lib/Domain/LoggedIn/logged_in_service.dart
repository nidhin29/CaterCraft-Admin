abstract class LoggedInService {
  Future<bool> isLoggedIn();
  Future<bool> isOnboarded();
  Future<bool> validateSession();
  Future<bool> refreshTokens();
}
