import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String name;
  final String confirmPassword;
  final String phone;
  final String password;

  const Register(
      {required this.phone,
      required this.password,
      required this.name,
      required this.confirmPassword});

  @override
  List<Object?> get props => [phone, password, confirmPassword, name];
}
