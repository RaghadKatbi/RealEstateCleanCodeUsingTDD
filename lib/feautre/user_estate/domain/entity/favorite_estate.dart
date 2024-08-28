import 'package:equatable/equatable.dart';

class FavoriteEstate extends Equatable {
  final int id;
  final int propertyId;
  final int userId;
  final String createdAt;
  final String updatedAt;

  FavoriteEstate(
      {required this.id,
      required this.propertyId,
      required this.userId,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [id,propertyId,userId,createdAt,updatedAt];
}
