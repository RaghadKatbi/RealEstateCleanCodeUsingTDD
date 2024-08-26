import 'package:real_estate/feautre/auth/domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.name,
    required super.phone,
    required super.updatedAt,
    required super.createdAt,
    required super.id,
    required super.password,
    required super.confirmPassword,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        name: json['name'],
        phone: json['phone'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        id: json['id'],
        password: '',
        confirmPassword: '');
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "password": password,
      "confirmPassword": confirmPassword
    };
  }
}
