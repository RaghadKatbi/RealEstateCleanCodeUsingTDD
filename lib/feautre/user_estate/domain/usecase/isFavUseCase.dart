import 'package:dartz/dartz.dart';

import '../../../../core/error/failer.dart';
import '../repository/estate_added_and_favorite_by_user_repository.dart';

class isFavUseCase {
  final EstateAddedAndFavoriteByUserRepository repository;

  isFavUseCase({required this.repository});

  Future<Either<Failure, bool>> call(int idEstate) async {
    return await repository.isFav(idEstate);
  }
}