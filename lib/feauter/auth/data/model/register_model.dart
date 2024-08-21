import 'package:real_estate/feauter/auth/domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required String name,
    required String phone,
    required String updatedAt,
    required String createdAt,
    required int id,
    required String password,
    required String confirmPassword,
  }) : super(
      createdAt,
      updatedAt,
      id,
      phone,
      password,
      name,
      confirmPassword);

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(name: json[''],
        phone: json[''],
        updatedAt: json[''],
        createdAt: json[''],
        id: json[''],
        password: json[''],
        confirmPassword: json['']);
        }

  Map<String, dynamic> toJson() {
    return {
      "name":name,
      "phone": phone,
      "password": password,
      "confirmPassword":confirmPassword
    };
  }
}
