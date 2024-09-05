import 'package:equatable/equatable.dart';

import '../../../city/domain/entity/city.dart';

class ReAgent extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String mobile;
  final String address;
  final String image;
  final String neighborhoodId;
  final String createdAt;
  final String updatedAt;
  final City city;

  ReAgent(
      {required this.city,
      required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.mobile,
      required this.address,
      required this.image,
      required this.neighborhoodId,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        email,
        mobile,
        address,
        image,
        neighborhoodId,
        createdAt,
        updatedAt
      ];
}
