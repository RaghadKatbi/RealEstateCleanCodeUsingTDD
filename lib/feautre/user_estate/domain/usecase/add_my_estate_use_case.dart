import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failer.dart';
import '../entity/estate_added_by_user.dart';
import '../repository/estate_added_and_favorite_by_user_repository.dart';

class AddMyEstateUseCase {
  final EstateAddedAndFavoriteByUserRepository repository;

  AddMyEstateUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(EstateAddedByUser estate,File image,File video){
    return repository.addedEstate(estate,image,video);
  }

}