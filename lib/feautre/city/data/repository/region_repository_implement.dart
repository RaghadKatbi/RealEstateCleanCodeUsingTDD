import 'package:dartz/dartz.dart';

import 'package:real_estate/core/error/failer.dart';

import 'package:real_estate/feautre/city/domain/entity/region.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/region_repository.dart';
import '../datasource/city_remote_datasource.dart';

class RegionRepositoryImplement implements RegionRepository {
  final CityRemoteDatasource cityRemoteDataSources;
  final NetworkInfo networkInfo;

  RegionRepositoryImplement(
      {required this.cityRemoteDataSources, required this.networkInfo});

  @override
  Future<Either<Failure, List<Region>>> getAllRegion(int idCity)async {
    if (await networkInfo.isConnected) {
      try{
        final remoteRegoin = await cityRemoteDataSources.getAllRegion(idCity);
        print(remoteRegoin);
        return right(remoteRegoin);
      }
      catch(e){
        print(e.toString());
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
