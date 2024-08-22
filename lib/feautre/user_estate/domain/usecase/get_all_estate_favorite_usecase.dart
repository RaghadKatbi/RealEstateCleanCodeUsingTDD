import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';
import 'package:real_estate/feautre/user_estate/domain/repository/estate_added_and_favorite_by_user_repository.dart';

class GetAllEstateFavoriteUseCase {
  final EstateAddedAndFavoriteByUserRepository repository;

  GetAllEstateFavoriteUseCase({required this.repository});

  Future<Either<Failure, List<FavoriteEstate>>> call() async {
    return await repository.getAllEstateFavorite();
  }
}
