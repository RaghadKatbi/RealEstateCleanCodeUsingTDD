import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/error/failer.dart';
import '../../domain/entity/estate_added_by_user.dart';
import '../../domain/entity/favorite_estate.dart';

abstract class DataSourcesUserEstate {
  Future<Either<Failure, Unit>> addedEstate();

  Future<Either<Failure, List<EstateAddedByUser>>> getAllEstateAddedByUser();

  Future<Either<Failure, List<FavoriteEstate>>> getAllEstateFavorite();

  Future<Either<Failure, Unit>> setFavoriteAndUnset(int idEstate);
}

class DataSourcesUserEstateImplement implements DataSourcesUserEstate{
  final ApiConsumer api;

  DataSourcesUserEstateImplement({required this.api});
  @override
  Future<Either<Failure, Unit>> addedEstate() {
    // TODO: implement addedEstate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<EstateAddedByUser>>> getAllEstateAddedByUser() {
    // TODO: implement getAllEstateAddedByUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<FavoriteEstate>>> getAllEstateFavorite() {
    // TODO: implement getAllEstateFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> setFavoriteAndUnset(int idEstate) {
    // TODO: implement setFavoriteAndUnset
    throw UnimplementedError();
  }

}
