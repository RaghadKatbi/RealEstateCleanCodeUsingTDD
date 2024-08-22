import 'package:real_estate/feautre/auth/domain/entities/login.dart';

class LoginModel extends LogIn {
  const LoginModel(
      { required super.phone, required super.password,required super.token,});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      phone: '', password: '',
      token: json['token'],
    );
  }
  Map<String ,dynamic> toJson(){
    return {"phone":phone,"password" : password, };
  }
}
