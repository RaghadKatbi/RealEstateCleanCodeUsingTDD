import 'package:equatable/equatable.dart';
import 'package:real_estate/feautre/city/domain/entity/neighborhood.dart';


class Estate extends Equatable {
  final int? id;
  final String type;
  final int? rooms;
  final int? bathrooms;
  final String purpose;
  final String price;
  final String state;
  final String space;
  final String direction;
  final String license;
  final String floor;
  final String description;
  final int? numberShow;
  final String meterPrice;
  final String streetWidth;
  final String location;
  final String features;
  final int neighborhoodId;
  final int? userId;
  final String estateImage;
  final String estateVideo;
  final int? buildingRank;
  final String status;
  final String createdAt;
  final String updatedAt;
  final Neighborhood neighborhood;

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
    required this.license,
    required this.floor,
    required this.description,
    required this.numberShow,
    required this.meterPrice,
    required this.streetWidth,
    required this.location,
    required this.features,
    required this.neighborhoodId,
    required this.userId,
    required this.estateImage,
    required this.estateVideo,
    required this.buildingRank,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.neighborhood,
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



