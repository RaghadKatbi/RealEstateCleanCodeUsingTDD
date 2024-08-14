import 'package:dartz/dartz.dart';

import '../entities/register.dart';


abstract class RegisterRepository{
  Future<Either<String, bool>> register(Register register);
}