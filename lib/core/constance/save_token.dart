import 'package:shared_preferences/shared_preferences.dart';

class SaveToken {
  late String token;
  late String tokenExpirationTimeString;

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenExpirationTimeString =
        prefs.getString('tokenExpirationTime') ??
            "${DateTime.now().toIso8601String()}";
    String? token = prefs.getString('token') ?? "null";
    DateTime tokenExpirationTime = DateTime.parse(tokenExpirationTimeString);
    DateTime currentTime = tokenExpirationTime.add(Duration(hours: 1));
    if (DateTime.now().isAfter(currentTime) ||
        currentTime.isAtSameMomentAs(DateTime.now())) {
      await prefs.setString('token', "null");
    }
    return token;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('tokenExpirationTime');
  }
}
