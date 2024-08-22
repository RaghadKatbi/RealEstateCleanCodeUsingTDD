import 'package:dartz/dartz.dart';

import '../entities/verification.dart';

abstract class VerificationRepository {
  Future<Either<String, bool>> verification(Verification verification);
}