import 'package:dartz/dartz.dart';
import 'package:real_estate/feauter/auth/domain/entities/verification.dart';
import 'package:real_estate/feauter/auth/domain/repositories/verification_repository.dart';


class VerificationUseCase{
final VerificationRepository repository;

  VerificationUseCase({required this.repository});
  Future<Either<String, bool>> call ( Verification verification ) async{
    return await repository.verification(verification);
  }
}