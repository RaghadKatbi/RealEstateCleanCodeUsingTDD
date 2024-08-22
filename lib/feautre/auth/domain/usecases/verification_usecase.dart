import 'package:dartz/dartz.dart';

import '../entities/verification.dart';
import '../repositories/verification_repository.dart';


class VerificationUseCase{
final VerificationRepository repository;

  VerificationUseCase({required this.repository});
  Future<Either<String, bool>> call ( Verification verification ) async{
    return await repository.verification(verification);
  }
}