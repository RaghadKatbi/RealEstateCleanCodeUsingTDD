import 'package:equatable/equatable.dart';


class Estate extends Equatable {
  final int id;
  final String type;
  final String purpose;
  final int rooms;
  final int bathrooms;
  final String price;
  final String state;
  final String space;
  final String direction;
  final String? license;
  final String floor;
  final String description;
  final int? numberShow;
  final String? meterPrice;
  final String streetWidth;
  final String location;
  final String features;
  final int neighborhoodId;
  final int? userId;
  final String estateImage;
  final String estateVideo;
  final int? buildingRank;
  final int? status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Estate({
    required this.id,
    required this.type,
    required this.purpose,
    required this.rooms,
    required this.bathrooms,
    required this.price,
    required this.state,
    required this.space,
    required this.direction,
    this.license,
    required this.floor,
    required this.description,
    this.numberShow,
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
    rooms,
    bathrooms,
    price,
    state,
    space,
    direction,
    license,
    floor,
    description,
    numberShow,
    meterPrice,
    streetWidth,
    location,
    features,
    neighborhoodId,
    userId,
    estateImage,
    estateVideo,
    buildingRank,
    status,
    createdAt,
    updatedAt,
  ];
}



