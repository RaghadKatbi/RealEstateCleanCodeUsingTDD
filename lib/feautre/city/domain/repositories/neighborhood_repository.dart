import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import '../entity/neighborhood.dart';

abstract class NeighborhoodRepository {
  Future<Either<Failure, List<Neighborhood>>> getAllNeighborhood(int idRegion);
}
