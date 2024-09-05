import 'package:real_estate/feautre/REagent/domain/entity/RE_agent.dart';

class ReAgentModel extends ReAgent {
  ReAgentModel(
      {required super.city,
      required super.id,
      required super.name,
      required super.phone,
      required super.email,
      required super.mobile,
      required super.address,
      required super.image,
      required super.neighborhoodId,
      required super.createdAt,
      required super.updatedAt});

  factory ReAgentModel.forJson(Map<String, dynamic> json) {
    return ReAgentModel(
        city: json[''],
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        mobile: json['mobile'],
        address: json['address'],
        image: json['image'],
        neighborhoodId: json['neighborhood_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
