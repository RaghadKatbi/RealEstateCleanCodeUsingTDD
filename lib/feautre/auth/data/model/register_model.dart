import 'package:real_estate/feautre/auth/domain/entities/register.dart';

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
            createdAt: createdAt,
            updatedAt: updatedAt,
            id: id,
            phone: phone,
            password: password,
            name: name,
            confirmPassword: confirmPassword);

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
