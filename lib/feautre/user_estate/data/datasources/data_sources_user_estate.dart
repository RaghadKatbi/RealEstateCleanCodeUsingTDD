import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:real_estate/core/api/end_ponits.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:real_estate/core/error/exptions.dart';
import 'package:real_estate/feautre/user_estate/data/model/estate_added_by_user_model.dart';
import 'package:real_estate/feautre/user_estate/data/model/favorite_estate_model.dart';
import '../../../../core/api/api_consumer.dart';
import '../../domain/entity/estate_added_by_user.dart';
import '../../domain/entity/favorite_estate.dart';

abstract class DataSourcesUserEstate {
  Future<Unit> addedEstate(EstateAddedByUserModel estate);

  Future<List<EstateAddedByUser>> getAllEstateAddedByUser();

  Future<List<FavoriteEstate>> getAllEstateFavorite();

  Future<Unit> setFavoriteAndUnset(int idEstate);
}

class DataSourcesUserEstateImplement implements DataSourcesUserEstate {
  final ApiConsumer api;

  DataSourcesUserEstateImplement({required this.api});

  @override
  Future<Unit> addedEstate(EstateAddedByUserModel estate) async {
    try {
      await api.post(EndPoint.addMyEstate, queryParameters: {
        "type": estate.propertyType,
        "purpose": estate.propertyPurpose,
        "room": estate.rooms,
        "bathroom": estate.bathrooms,
        "price": estate.price,
        "state": estate.status,
        "space": estate.space,
        "direction": estate.direction,
        "license": estate.license,
        "floor": estate.floor,
        "description": estate.description,
        "meter_price": estate.meterPrice,
        "street_width": estate.streetWidth,
        "location": estate.location,
        "features": estate.features,
        "neighborhood_id": estate.neighborhoodId,
        "building_rank": estate.buildingRank,
        "note": estate.note,
        "token": getToken()
      });
      return Future.value(unit);
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<EstateAddedByUser>> getAllEstateAddedByUser() async {
    try {
      final response = await api.get(EndPoint.getMyEstate,
          queryParameters: {ApiKey.token: getToken()});
      List<EstateAddedByUserModel> Estate = await (response['data'] as List)
          .map((estate) => EstateAddedByUserModel.fromJson(estate))
          .toList();
      return Estate;
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<FavoriteEstate>> getAllEstateFavorite() async {
    try {
      final response = await api.get(EndPoint.getMyFavEstate,
          queryParameters: {ApiKey.token: getToken()});
      List<FavoriteEstate> Estate = await (response['data'] as List)
          .map((estate) => FavoriteEstateModel.fromJson(estate))
          .toList();
      return Estate;
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Unit> setFavoriteAndUnset(int idEstate) async {
    try {
      api.post(EndPoint.setFav(idEstate),
          queryParameters: {ApiKey.token: getToken()});
      return Future.value(unit);
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }
}
