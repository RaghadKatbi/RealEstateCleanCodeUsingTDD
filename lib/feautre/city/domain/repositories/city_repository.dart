import 'package:dartz/dartz.dart';


import '../../../../core/error/failer.dart';
import '../entity/city.dart';

abstract class CityRepository {
  Future<Either<Failure, List<City>>> getAllCity();
}