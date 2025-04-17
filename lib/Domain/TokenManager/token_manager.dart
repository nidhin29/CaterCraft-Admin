class TokenManager {
  TokenManager._internal();
  static TokenManager instance = TokenManager._internal();
  factory TokenManager() => instance;

  String? _email;
  String? _password;
  String? _name;

  String? get email => _email;
  String? get password => _password;
  String? get name => _name;

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  setName(String name) {
    _name = name;
  }
}
