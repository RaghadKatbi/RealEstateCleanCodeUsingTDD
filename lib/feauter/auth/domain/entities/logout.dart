import 'package:equatable/equatable.dart';

class Logout extends Equatable{
  final String token;

  Logout({required this.token});


  @override
  List<Object?> get props => [token];

}