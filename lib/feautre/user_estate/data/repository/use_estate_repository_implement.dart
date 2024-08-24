import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/exptions.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/core/network/network_info.dart';
import 'package:real_estate/feautre/user_estate/data/datasources/data_sources_user_estate.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/estate_added_by_user.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';
import 'package:real_estate/feautre/user_estate/domain/repository/estate_added_and_favorite_by_user_repository.dart';

class UseEstateRepositoryImplement
    implements EstateAddedAndFavoriteByUserRepository {
  final DataSourcesUserEstate dataSourcesUserEstate;

  final NetworkInfo networkInfo;

  UseEstateRepositoryImplement(
      {required this.dataSourcesUserEstate, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addedEstate() async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesUserEstate.addedEstate();
      return const Right(unit);
    } else {
      Left(OfflineFailure());
    }
    throw ServerException();
  }

  @override
  Future<Either<Failure, List<EstateAddedByUser>>> getAllEstateAddedByUser() async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesUserEstate.getAllEstateAddedByUser();
      return  Right(response as List<EstateAddedByUser>);
    } else {
      Left(OfflineFailure());
    }
    throw ServerException();
  }

  @override
  Future<Either<Failure, List<FavoriteEstate>>> getAllEstateFavorite() async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesUserEstate.getAllEstateFavorite();
      return  Right(response as List<FavoriteEstate>);
    } else {
      Left(OfflineFailure());
    }
    throw ServerException();
  }

  @override
  Future<Either<Failure, Unit>> setFavoriteAndUnset(int idEstate) async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesUserEstate.getAllEstateFavorite();
      return  const Right(unit);
    } else {
      Left(OfflineFailure());
    }
    throw ServerException();
  }
}
