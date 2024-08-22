import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';
import 'package:real_estate/feautre/estate/domain/repository/estate_repository.dart';

import '../../../../core/error/failer.dart';

class GetFilterEstateByTypeUseCase{
  final EstateRepository repository;

  GetFilterEstateByTypeUseCase({required this.repository});

  Future<Either<Failure,List<Estate>>> call(String type,String purpose) async {
    return await repository.getFilterEstateByType(type, purpose);
  }

}