import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveToken {
  late String token;
  late DateTime tokenExpirationTime;

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "null";
    String expirationTimeString = prefs.getString('tokenExpirationTime') ?? "";
    tokenExpirationTime = expirationTimeString.isNotEmpty ? DateTime.parse(expirationTimeString) : DateTime.now();
    if (isTokenExpired()) {
      await prefs.setString('token', 'null');
      await prefs.setString('tokenExpirationTime', tokenExpirationTime.toIso8601String());
    }
    return token;
  }

  bool isTokenExpired() {
    return DateTime.now().isAfter(tokenExpirationTime);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('tokenExpirationTime');
  }
}