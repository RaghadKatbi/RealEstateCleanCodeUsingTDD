import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';
import 'package:real_estate/feautre/estate/domain/repository/estate_repository.dart';

import '../../../../core/error/failer.dart';

class GetEstateUseCase{
  final EstateRepository repository;

  GetEstateUseCase({required this.repository});

  Future<Either<Failure,Estate>> call(int idEstate) async {
    return await repository.getEstate(idEstate);
  }

}