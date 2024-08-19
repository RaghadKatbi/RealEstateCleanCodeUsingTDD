import 'package:dartz/dartz.dart';

import '../../data/model/register_model.dart';

abstract class UserRepository {
  Future<Either<String, bool>> user(User user);
}