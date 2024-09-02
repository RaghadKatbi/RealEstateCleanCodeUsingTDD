import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class EstateAddedByUser extends Equatable {
  final int id;
  final String propertyType;
  final String propertyPurpose;
  final int rooms;
  final int bathrooms;
  final String price;
  final String space;
  final String direction;
  final String license;
  final String floor;
  final String description;
  final String meterPrice;
  final String streetWidth;
  final String location;
  final String features;
  final int neighborhoodId;
  final int userId;
  final int buildingRank;
  final String status;
  final String note;
  final String updatedAt;
  final String createdAt;
  final String image;
  final String video;
  final int? reason;
  final String? detaillsAddress;

  const EstateAddedByUser({
    required this.detaillsAddress,
    required this.reason,
    required this.image,
    required this.video,
    required this.id,
    required this.propertyType,
    required this.propertyPurpose,
    required this.rooms,
    required this.bathrooms,
    required this.price,
    required this.space,
    required this.direction,
    required this.license,
    required this.floor,
    required this.description,
    required this.meterPrice,
    required this.streetWidth,
    required this.location,
    required this.features,
    required this.neighborhoodId,
    required this.userId,
    required this.buildingRank,
    required this.status,
    required this.note,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        id,
        propertyType,
        propertyPurpose,
        rooms,
        bathrooms,
        price,
        space,
        direction,
        license,
        floor,
        description,
        meterPrice,
        streetWidth,
        location,
        features,
        neighborhoodId,
        userId,
        buildingRank,
        status,
        note,
        updatedAt,
        createdAt,
      ];
}
