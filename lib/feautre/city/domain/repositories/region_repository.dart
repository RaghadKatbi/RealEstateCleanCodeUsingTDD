import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import '../entity/region.dart';


abstract class RegionRepository {
  Future<Either<Failure, Region>> getAllRegion(int idCity);
}