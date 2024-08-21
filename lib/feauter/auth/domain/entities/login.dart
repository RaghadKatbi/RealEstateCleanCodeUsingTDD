import 'package:equatable/equatable.dart';

class LogIn extends Equatable{
  final String phone;
  final String password;
  final String token;
  const LogIn( this.phone,  this.password, this.token, );

  @override
  List<Object?> get props => [phone,password,token];

}