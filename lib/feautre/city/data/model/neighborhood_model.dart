import 'package:real_estate/feautre/city/domain/entity/neighborhood.dart';

class NeighborhoodModel extends Neighborhood {
  const NeighborhoodModel(
      {required super.id,
      required super.name,
      required super.regionId,
      required super.createdAt,
      required super.updatedAt});

  factory NeighborhoodModel.fromJson(Map<String, dynamic> json) {
    return NeighborhoodModel(
        id: json['id'],
        name: json['name'],
        regionId: json['region_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
