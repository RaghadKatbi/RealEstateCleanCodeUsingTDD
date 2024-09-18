import 'package:shared_preferences/shared_preferences.dart';

class SaveToken {
  late String token;
  late String tokenExpirationTimeString;

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenExpirationTimeString =
        prefs.getString('tokenExpirationTime') ??
            "${DateTime.now().toIso8601String()}";
    DateTime tokenExpirationTime = DateTime.parse(tokenExpirationTimeString);
   // print(tokenExpirationTime);
    DateTime currentTime = tokenExpirationTime.add(Duration(hours: 1));
    print(currentTime);
    if (DateTime.now().isAfter(currentTime) ||
        currentTime.isAtSameMomentAs(DateTime.now())) {
      await prefs.setString('token', "null");
    }
  token = prefs.getString('token') ?? "null";

    return token;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('tokenExpirationTime');
  }
}
