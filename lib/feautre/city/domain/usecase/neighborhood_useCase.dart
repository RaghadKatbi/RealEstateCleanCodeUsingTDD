import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/city/domain/entity/neighborhood.dart';
import '../../../../core/error/failer.dart';
import '../repositories/neighborhood_repository.dart';


class NeighborhoodUseCase{

  NeighborhoodRepository repository ;
  NeighborhoodUseCase({required this.repository});

  Future<Either<Failure, List<Neighborhood>>> call (int idRegion) async {
    return await repository.getAllNeighborhood(idRegion);
  }

}