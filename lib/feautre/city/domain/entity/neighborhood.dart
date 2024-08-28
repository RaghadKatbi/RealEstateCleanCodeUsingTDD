import 'package:equatable/equatable.dart';


class Neighborhood extends Equatable {
  final int id;
  final String name;
  final int regionId;
  final String createdAt;
  final String updatedAt;

  const Neighborhood({
    required this.id,
    required this.name,
    required this.regionId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [id, name, regionId, createdAt, updatedAt,];
}