import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/city/domain/entity/region.dart';
import '../../../../core/error/failer.dart';
import '../repositories/region_repository.dart';

class RegionUseCase{

  RegionRepository repository ;
  RegionUseCase({required this.repository});

  Future<Either<Failure,List<Region>>> call (int idCity) async {
    return await repository.getAllRegion(idCity);
  }

}