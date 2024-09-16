import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/user_estate/domain/repository/estate_added_and_favorite_by_user_repository.dart';

class SetFavoriteAndUnsetUseCase {
  final EstateAddedAndFavoriteByUserRepository repository;

  SetFavoriteAndUnsetUseCase({required this.repository});

  Future<Either<Failure, bool>> call(int idEstate) async {
    return await repository.setFavoriteAndUnset(idEstate);
  }
}
