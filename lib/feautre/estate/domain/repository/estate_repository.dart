import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';

abstract class EstateRepository {
 Future<Either<Failure,Unit>> getAllEstate();
 Future<Either<Failure,Unit>> getFilterEstateByType(String type,String purpose);
}