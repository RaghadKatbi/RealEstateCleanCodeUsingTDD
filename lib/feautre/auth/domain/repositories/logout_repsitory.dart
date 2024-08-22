import 'package:dartz/dartz.dart';

import '../entities/logout.dart';

abstract class LogoutRepository {
  Future<Either<String, bool>> logout(Logout logout);
}