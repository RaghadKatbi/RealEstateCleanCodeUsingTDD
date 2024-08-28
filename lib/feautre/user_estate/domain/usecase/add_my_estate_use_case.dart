import 'package:dartz/dartz.dart';

import '../../../../core/error/failer.dart';
import '../entity/estate_added_by_user.dart';
import '../repository/estate_added_and_favorite_by_user_repository.dart';

class AddMyEstateUseCase {
  final EstateAddedAndFavoriteByUserRepository repository;

  AddMyEstateUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(EstateAddedByUser estate){
    return repository.addedEstate(estate);
  }

}