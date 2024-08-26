part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  final String token;
  LoginSuccess({required this.token});
}
final class LoginFailure extends AuthState {
  final String message;
  LoginFailure({required this.message});
}
final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {
  // final RegisterModel user ;
  //
  // RegisterSuccess({required this.user});
}
final class RegisterFailure extends AuthState {
  final String message;
  RegisterFailure({required this.message});
}
