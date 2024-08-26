import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';
import 'package:real_estate/feautre/estate/domain/repository/estate_repository.dart';

import '../../../../core/error/failer.dart';

class GetAllEstateUseCase{
  final EstateRepository repository;

  GetAllEstateUseCase({required this.repository});

  Future<Either<Failure,List<Estate>>> call(String nameCity) async {
    return await repository.getAllEstate(nameCity);
  }

}