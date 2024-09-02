import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';

abstract class EstateRepository {
 Future<Either<Failure,List<Estate>>> getAllEstate(String nameCity);
 Future<Either<Failure,List<Estate>>> getFilterEstateByType(String type,String purpose,String city);
}