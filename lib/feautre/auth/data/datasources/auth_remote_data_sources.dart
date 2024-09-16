import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:real_estate/feautre/auth/data/model/login_model.dart';
import 'package:real_estate/feautre/auth/data/model/register_model.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';

abstract class AuthRemoteDataSources {
  Future<LoginModel> login(LoginModel login);

  Future<RegisterModel> register(RegisterModel register);
}

class AuthRemoteDataSourcesDio implements AuthRemoteDataSources {
  final ApiConsumer api;

  AuthRemoteDataSourcesDio({required this.api});

  @override
  Future<LoginModel> login(LoginModel login) async {
    final response = await api.post(EndPoint.signIn,
          queryParameters: {"phone": login.phone, "password": login.password});
      final user = LoginModel.fromJson(response);
     final prefs = await SharedPreferences.getInstance();
     await prefs.setString('token', user.token);
     await prefs.setString("'tokenExpirationTime'", DateTime.now().toIso8601String());
      return user;
  }
  @override
  Future<RegisterModel> register(RegisterModel register) async {
      final response = await api.post(
        EndPoint.signUp,
        queryParameters: {
          "name": register.name,
          "phone": register.phone,
          "password": register.password,
          "password_confirmation": register.confirmPassword
        },
      );
      final loginUser=LoginModel(phone: register.phone, password: register.password, token: '');
      final logIn =login(loginUser);
      print(logIn.toString());
      final user = RegisterModel.fromJson(response['user']);
      return user;
  }
}
