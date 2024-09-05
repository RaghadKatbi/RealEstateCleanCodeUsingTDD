import 'package:equatable/equatable.dart';


class Region extends Equatable {
  final int id;
  final String name;
  final int cityId;
  final String createdAt;
  final String updatedAt;

  const Region({
    required this.id,
    required this.name,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [id, name, cityId, createdAt, updatedAt,];
}