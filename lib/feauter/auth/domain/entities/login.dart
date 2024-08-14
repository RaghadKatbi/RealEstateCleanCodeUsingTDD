import 'package:equatable/equatable.dart';

class LogIn extends Equatable{
  final String phone;
  final String password;

  LogIn({required this.phone, required this.password});

  @override
  List<Object?> get props => [phone,password];

}