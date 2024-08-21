import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';

import '../entities/register.dart';


abstract class RegisterRepository{
  Future<Either<Failure, Register>> register(Register register);
}