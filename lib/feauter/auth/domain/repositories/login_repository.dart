import 'package:dartz/dartz.dart';

import '../entities/login.dart';

abstract class LoginRepository {
  Future<Either<String, bool>> login(LogIn login);
}