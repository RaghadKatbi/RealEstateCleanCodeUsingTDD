import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/estate_added_by_user.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';

abstract class EstateAddedAndFavoriteByUserRepository {
  Future<Either<Failure, Unit>> addedEstate();

  Future<Either<Failure, List<EstateAddedByUser>>> getAllEstateAddedByUser();

  Future<Either<Failure, List<FavoriteEstate>>> getAllEstateFavorite();

  Future<Either<Failure, Unit>> setFavoriteAndUnset(int idEstate);
}
