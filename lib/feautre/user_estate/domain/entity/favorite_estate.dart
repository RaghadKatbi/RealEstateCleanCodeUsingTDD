import 'package:equatable/equatable.dart';

class FavoriteEstate extends Equatable {
  final int id;
  final String type;
  final String purpose;
  final int room;
  final int bathroom;
  final String price;
  final String state;
  final String space;
  final String direction;
  final String? license;
  final String floor;
  final String description;
  final int numberShow;
  final String? meterPrice;
  final String streetWidth;
  final String location;
  final String features;
  final int neighborhoodId;
  final int? userId;
  final String estateImage;
  final String estateVideo;
  final int? buildingRank;
  final String? status;
  final String createdAt;
  final String updatedAt;

  FavoriteEstate({
    required this.id,
    required this.type,
    required this.purpose,
    required this.room,
    required this.bathroom,
    required this.price,
    required this.state,
    required this.space,
    required this.direction,
    this.license,
    required this.floor,
    required this.description,
    required this.numberShow,
    this.meterPrice,
    required this.streetWidth,
    required this.location,
    required this.features,
    required this.neighborhoodId,
    this.userId,
    required this.estateImage,
    required this.estateVideo,
    this.buildingRank,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        purpose,
        room,
        price,
        bathroom,
        state,
        status,
        createdAt,
        updatedAt,
        space,
        buildingRank,
        estateVideo,
        estateImage,
        userId,
        neighborhoodId,
        features,
        location,
        streetWidth,
        meterPrice,
        numberShow,
        floor,
        license,
        direction,
      ];
}
