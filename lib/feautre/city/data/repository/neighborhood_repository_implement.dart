import 'package:dartz/dartz.dart';

import 'package:real_estate/core/error/failer.dart';

import 'package:real_estate/feautre/city/domain/entity/neighborhood.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/neighborhood_repository.dart';
import '../datasource/city_remote_datasource.dart';

class NeighborhoodRepositoryImplement implements NeighborhoodRepository {
  final CityRemoteDatasource cityRemoteDataSources;
  final NetworkInfo networkInfo;

  NeighborhoodRepositoryImplement({required this.cityRemoteDataSources, required this.networkInfo});


  @override
  Future<Either<Failure, List<Neighborhood>>> getAllNeighborhood(int idRegion) async {
    if (await networkInfo.isConnected) {
      try{
        final remoteNeighborhood = await cityRemoteDataSources.getAllNeighborhood(idRegion);
        print(remoteNeighborhood);
        return right(remoteNeighborhood);
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