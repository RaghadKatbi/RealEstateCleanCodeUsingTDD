import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../repositories/user_repsitory.dart';

class UserUseCase {
  final UserRepository repository;

  UserUseCase({required this.repository});

  Future<Either<String, bool>> call(User user) async {
    return await repository.user(user);
  }
}
