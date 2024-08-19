import 'package:dartz/dartz.dart';

import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<String, bool>> user(User user);
}