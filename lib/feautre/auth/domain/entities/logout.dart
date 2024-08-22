import 'package:equatable/equatable.dart';

class Logout extends Equatable{
  final String token;

  const Logout({required this.token});


  @override
  List<Object?> get props => [token];

}