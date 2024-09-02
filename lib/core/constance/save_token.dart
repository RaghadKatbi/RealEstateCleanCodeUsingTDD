import 'package:shared_preferences/shared_preferences.dart';

class SaveToken{
  late String token;

  Future<String?> getToken () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')??"null";
    return token;
  }
}