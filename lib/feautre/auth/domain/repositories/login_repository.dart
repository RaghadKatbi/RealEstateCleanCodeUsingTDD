import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';

import '../entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, LogIn>> login(LogIn login);
}