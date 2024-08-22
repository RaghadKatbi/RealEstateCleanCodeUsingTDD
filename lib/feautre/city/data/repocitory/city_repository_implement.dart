import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entity/city.dart';
import '../../domain/repositories/city_repository.dart';
import '../datasource/city_remote_datasource.dart';

class CityRepositoryImplement implements CityRepository {
  final CityRemoteDatasource cityRemoteDataSources;
  final NetworkInfo networkInfo;

  CityRepositoryImplement(
      {required this.cityRemoteDataSources, required this.networkInfo});

  @override
  Future<Either<Failure, List<City>>> getAllCity(City city) async {
    if(await networkInfo.isConnected){
      final remoteCity= await cityRemoteDataSources.getAllCities();
      return right(remoteCity);
    }
    else {
      return Left(OfflineFailure());
    }
  }
}
