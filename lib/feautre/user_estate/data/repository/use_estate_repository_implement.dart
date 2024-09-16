import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/core/network/network_info.dart';
import 'package:real_estate/feautre/user_estate/data/datasources/data_sources_user_estate.dart';
import 'package:real_estate/feautre/user_estate/data/model/estate_added_by_user_model.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/estate_added_by_user.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';
import 'package:real_estate/feautre/user_estate/domain/repository/estate_added_and_favorite_by_user_repository.dart';

class UserEstateRepositoryImplement
    implements EstateAddedAndFavoriteByUserRepository {
  final DataSourcesUserEstate dataSourcesUserEstate;

  final NetworkInfo networkInfo;

  UserEstateRepositoryImplement(
      {required this.dataSourcesUserEstate, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addedEstate(
      EstateAddedByUser estate, File image, File video) async {
    final EstateAddedByUserModel estateModel = EstateAddedByUserModel(
        image: estate.image,
        video: estate.video,
        id: estate.id,
        propertyType: estate.propertyType,
        propertyPurpose: estate.propertyPurpose,
        rooms: estate.rooms,
        bathrooms: estate.bathrooms,
        price: estate.price,
        space: estate.space,
        direction: estate.direction,
        license: estate.license,
        floor: estate.floor,
        description: estate.description,
        meterPrice: estate.meterPrice,
        streetWidth: estate.streetWidth,
        location: estate.location,
        features: estate.features,
        neighborhoodId: estate.neighborhoodId,
        userId: estate.userId,
        buildingRank: estate.buildingRank,
        status: estate.status,
        note: estate.note,
        updatedAt: estate.updatedAt,
        createdAt: estate.createdAt,
        reason: "",
        detaillsAddress: '');
    if (await networkInfo.isConnected) {
      try {
        await dataSourcesUserEstate.addedEstate(estateModel, image, video);
        return const Right(unit);
      } on DioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<EstateAddedByUser>>>
      getAllEstateAddedByUser() async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesUserEstate.getAllEstateAddedByUser();
      return Right(response);
    } else {
      Left(OfflineFailure());
    }
    throw Exception();
  }

  @override
  Future<Either<Failure, List<FavoriteEstate>>> getAllEstateFavorite() async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesUserEstate.getAllEstateFavorite();
      return Right(response);
    } else {
      Left(OfflineFailure());
    }
    throw Exception();
  }

  @override
  Future<Either<Failure, bool>> setFavoriteAndUnset(int idEstate) async {
    if (await networkInfo.isConnected) {
      final response =
          await dataSourcesUserEstate.setFavoriteAndUnset(idEstate);
      return Right(response);
    } else {
      Left(OfflineFailure());
    }
    throw Exception();
  }

  @override
  Future<Either<Failure, bool>> isFav(int idEstate) async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesUserEstate.isFav(idEstate);
      return Right(response);
    } else {
      Left(OfflineFailure());
    }
    throw Exception();
  }
}
