import 'package:equatable/equatable.dart';

import 'city.dart';

class Region extends Equatable {
  final int id;
  final String name;
  final int cityId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final City city;

  const Region({
    required this.id,
    required this.name,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
    required this.city,
  });

  @override
  List<Object> get props => [id, name, cityId, createdAt, updatedAt, city];
}