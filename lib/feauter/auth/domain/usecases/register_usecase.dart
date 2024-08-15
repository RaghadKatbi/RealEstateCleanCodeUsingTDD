import 'package:dartz/dartz.dart';

import 'package:real_estate/feauter/auth/domain/entities/register.dart';

import 'package:real_estate/feauter/auth/domain/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase({required this.repository});

  Future<Either<String, bool>> call(Register register) async {
    return await repository.register(register);
  }
}
