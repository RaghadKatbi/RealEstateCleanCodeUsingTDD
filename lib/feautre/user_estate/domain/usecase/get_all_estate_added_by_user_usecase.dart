import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/estate_added_by_user.dart';

import '../repository/estate_added_and_favorite_by_user_repository.dart';

class GetAllEstateAddedByUserUseCase {
  final EstateAddedAndFavoriteByUserRepository repository;

  GetAllEstateAddedByUserUseCase({required this.repository});

  Future<Either<Failure, List<EstateAddedByUser>>> call() async {
    return await repository.getAllEstateAddedByUser();
  }
}
