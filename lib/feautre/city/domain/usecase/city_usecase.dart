import 'package:dartz/dartz.dart';
import '../../../../core/error/failer.dart';
import '../../../auth/domain/entities/login.dart';
import '../entity/city.dart';
import '../repositories/city_repository.dart';

class CityUseCase{

  CityRepository repository ;
  CityUseCase({required this.repository});

  Future<Either<Failure, List<City>>> call ( City city )async{
    return await repository.getAllCity(city);
  }

}