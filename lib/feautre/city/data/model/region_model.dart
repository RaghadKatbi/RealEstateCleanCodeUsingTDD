import 'package:real_estate/feautre/city/domain/entity/region.dart';

class RegionModel extends Region {
  const RegionModel(
      {required id,
      required name,
      required cityId,
      required createdAt,
      required updatedAt,})
      : super(
            id: id,
            name: name,
            cityId: cityId,
            createdAt: createdAt,
            updatedAt: updatedAt,);

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
        id: json['id'],
        name: json['name'],
        cityId: json['city_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],);
  }
}
