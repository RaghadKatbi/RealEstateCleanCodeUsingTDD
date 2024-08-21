import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String name;
  final String phone;
  final String updatedAt;
  final String createdAt;
  final int id;
  final String password;
  final String confirmPassword;

  const Register(this.updatedAt, this.createdAt, this.id, this.phone,
      this.password, this.name, this.confirmPassword);

  @override
  List<Object?> get props =>
      [phone, password, confirmPassword, name, updatedAt, createdAt, id];
}
