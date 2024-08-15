import 'package:dartz/dartz.dart';
import 'package:real_estate/feauter/auth/domain/entities/login.dart';
import 'package:real_estate/feauter/auth/domain/repositories/login_repository.dart';

class LoginUseCase{
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<String, bool>> call ( LogIn login )async{
    return await repository.login(login);
  }
}