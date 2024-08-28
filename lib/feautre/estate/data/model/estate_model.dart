import 'package:real_estate/feautre/city/data/model/neighborhood_model.dart';
import 'package:real_estate/feautre/city/domain/entity/neighborhood.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';

class EstateModel extends Estate {
  const EstateModel(
      {required super.id,
      required super.type,
      required super.purpose,
      required super.rooms,
      required super.bathrooms,
      required super.price,
      required super.state,
      required super.space,
      required super.direction,
      required super.floor,
      required super.description,
      required super.streetWidth,
      required super.location,
      required super.features,
      required super.neighborhoodId,
      required super.estateImage,
      required super.estateVideo,
      required super.createdAt,
      required super.updatedAt,
      required super.buildingRank,
      required super.license,
      required super.meterPrice,
      required super.numberShow,
      required super.status,
      required super.userId,
      required super.neighborhood});

  factory EstateModel.fromJson(Map<String, dynamic> json) {
    return EstateModel(
      id: json['id'] ?? 0,
      type: json['type'] ?? "",
      purpose: json['purpose'] ?? "",
      rooms: json['room'] ,
      bathrooms: json['bathroom'] != null ? json['bathroom'] : 0,
      price: json['price'] ?? "",
      state: json['state'] ?? "",
      space: json['space'] ?? "",
      direction: json['direction'] ?? "",
      floor: json['floor'] != null ? json['floor'] : "",
      description: json['description'] ?? "",
      streetWidth: json['street_width'] ?? "",
      location: json['location'] ?? "",
      features: json['features'] ?? "",
      neighborhoodId:
          json['neighborhood_id'] != null ? json['neighborhood_id'] : 0,
      estateImage: json['estate_image'] ?? "",
      estateVideo: json['estate_video'] ?? "",
      createdAt: json['created_at'] ,
      updatedAt: json['updated_at'],
      buildingRank: json['building_rank'] != null ? json['building_rank'] : 0,
      license: json['license'] ?? "",
      meterPrice: json['meter_price'] != null ? json['meter_price'] : "",
      numberShow: json['number_show'] != null ? json['number_show'] : 0,
      status: json['status_'] != null ? json['status_'] : "",
      userId: json['user_id'] != null ? json['user_id'] : 0,
      neighborhood: NeighborhoodModel.fromJson(json['neighborhood']),
    );
  }
}
