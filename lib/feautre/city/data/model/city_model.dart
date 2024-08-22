import '../../domain/entity/city.dart';

class CityModel extends City {
  const CityModel(
      {required id,
      required name,
      required createdAt,
      required updatedAt,
      required cityImage})
      : super(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
            cityImage: cityImage);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      cityImage: json['city_image'],
    );
  }
}
