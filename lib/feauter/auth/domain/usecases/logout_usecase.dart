import 'package:dartz/dartz.dart';
import 'package:real_estate/feauter/auth/domain/entities/logout.dart';
import 'package:real_estate/feauter/auth/domain/repositories/logout_repsitory.dart';

class LogoutUseCase{
  final LogoutRepository repository;

  LogoutUseCase({required this.repository});

  Future<Either<String, bool>> call ( Logout logout )async{
    return await repository.logout(logout);
  }
}