import 'package:real_estate/feautre/user_estate/domain/entity/estate_added_by_user.dart';

class EstateAddedByUserModel extends EstateAddedByUser {
  const EstateAddedByUserModel({
    required super.image,
    required super.video,
    required super.id,
    required super.propertyType,
    required super.propertyPurpose,
    required super.rooms,
    required super.bathrooms,
    required super.price,
    required super.space,
    required super.direction,
    required super.license,
    required super.floor,
    required super.description,
    required super.meterPrice,
    required super.streetWidth,
    required super.location,
    required super.features,
    required super.neighborhoodId,
    required super.userId,
    required super.buildingRank,
    required super.status,
    required super.note,
    required super.updatedAt,
    required super.createdAt,
    required super.reason,
    required super.detaillsAddress,
  });

  factory EstateAddedByUserModel.fromJson(Map<String, dynamic> json) {
    return EstateAddedByUserModel(
      image: json['estate_image'] ?? "",
      video: json['estate_video'] ?? "",
      id: json['id'] ?? 0,
      propertyType: json['type'] ?? "",
      propertyPurpose: json['purpose'] ?? "",
      rooms: json['room'] ?? 0,
      bathrooms: json['bathroom'] ?? 0,
      price: json['price'] ?? "",
      space: json['space'] ?? "",
      direction: json['direction'] ?? "",
      license: json['license'] ?? "",
      floor: json['floor'] ?? 0,
      description: json['description'] ?? "",
      meterPrice: json['meter_price'] != null ? int.tryParse(json['meter_price']) ?? 0 : 0,
      streetWidth: json['street_width'] ?? 0,
      location: json['location'] ?? "",
      features: json['features'] ?? "",
      neighborhoodId: json['neighborhood_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      buildingRank: json['building_rank'] ?? 0,
      status: json['status_'] ?? "",
      note: json['note'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      createdAt: json['created_at'] ?? "",
      reason: json['reason'] ?? "0",
      detaillsAddress: json['detaills_address'] ?? "",
    );
  }
}
