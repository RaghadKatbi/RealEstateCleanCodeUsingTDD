import 'package:equatable/equatable.dart';
import 'package:real_estate/feautre/city/domain/entity/region.dart';

class Neighborhood extends Equatable {
  final int id;
  final String name;
  final int regionId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Region region;

  const Neighborhood({
    required this.id,
    required this.name,
    required this.regionId,
    required this.createdAt,
    required this.updatedAt,
    required this.region,
  });

  @override
  List<Object> get props => [id, name, regionId, createdAt, updatedAt, region];
}