import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String name;
  final String phone;
  final String updatedAt;
  final String createdAt;
  final int id;
  final String password;
  final String confirmPassword;

  const Register(
      {required this.updatedAt,
      required this.createdAt,
      required this.id,
      required this.phone,
      required this.password,
      required this.name,
      required this.confirmPassword});

  @override
  List<Object?> get props =>
      [phone, password, confirmPassword, name, updatedAt, createdAt, id];
}
