import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:real_estate/core/api/end_ponits.dart';
import 'package:real_estate/core/error/exptions.dart';
import 'package:real_estate/feautre/user_estate/data/model/estate_added_by_user_model.dart';
import 'package:real_estate/feautre/user_estate/data/model/favorite_estate_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/api/api_consumer.dart';
import '../../domain/entity/estate_added_by_user.dart';
import '../../domain/entity/favorite_estate.dart';

abstract class DataSourcesUserEstate {
  Future<Unit> addedEstate(
      EstateAddedByUserModel estate, File image, File video);

  Future<List<EstateAddedByUser>> getAllEstateAddedByUser();

  Future<List<FavoriteEstate>> getAllEstateFavorite();

  Future<bool> setFavoriteAndUnset(int idEstate);
  Future<bool> isFav(int idEstate);
}

class DataSourcesUserEstateImplement implements DataSourcesUserEstate {
  final ApiConsumer api;

  DataSourcesUserEstateImplement({required this.api});

  @override
  Future<Unit> addedEstate(
      EstateAddedByUserModel estate, File image, File video) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(image);
    print(video);
    try {
      await api.post(EndPoint.addMyEstate,
          queryParameters: {
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
            "token": token
          },
          data: {
            "estate_image": await MultipartFile.fromFile(image.path),
            "estate_video": await MultipartFile.fromFile(video.path),
          },
          isFromData: true);
      return Future.value(unit);
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<EstateAddedByUser>> getAllEstateAddedByUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await api
          .get(EndPoint.getMyEstate, queryParameters: {ApiKey.token: token});
      List<EstateAddedByUserModel> estatePended = (response['data']['pended'] as List)
          .map((estate) => EstateAddedByUserModel.fromJson(estate))
          .toList();

      List<EstateAddedByUserModel> estateAccepted = (response['data']['accepted'] as List)
          .map((estate) => EstateAddedByUserModel.fromJson(estate))
          .toList();

      List<EstateAddedByUserModel> estateCanceled = (response['data']['canceled'] as List)
          .map((estate) => EstateAddedByUserModel.fromJson(estate))
          .toList();


      List<EstateAddedByUserModel> estate = [];
      estate.addAll(estatePended);
      estate.addAll(estateAccepted);
      estate.addAll(estateCanceled);
      print(estate);
      return estate;
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<FavoriteEstate>> getAllEstateFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await api
          .get(EndPoint.getMyFavEstate, queryParameters: {ApiKey.token: token});
      List<FavoriteEstate> Estate = await (response['data'] as List)
          .map((estate) => FavoriteEstateModel.fromJson(estate))
          .toList();
      return Estate;
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> setFavoriteAndUnset(int idEstate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
     final response=await api.post(EndPoint.setFav(idEstate),
          queryParameters: {ApiKey.token: token});
      return Future.value(response['isFavorited']);
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> isFav(int idEstate) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response=await api.get(EndPoint.isFav(idEstate),queryParameters:{ApiKey.token: token});
      return Future.value(response['isFavorited']);
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }
}
