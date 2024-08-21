import 'package:real_estate/feauter/auth/domain/entities/login.dart';

class LoginModel extends LogIn {
  const LoginModel(
      { required String phone, required String password,required String token,})
      : super(phone,password,token);
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
