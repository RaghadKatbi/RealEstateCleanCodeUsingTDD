import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';

class FavoriteEstateModel extends FavoriteEstate {
  FavoriteEstateModel({required super.id,
    required super.propertyId,
    required super.userId,
    required super.createdAt,
    required super.updatedAt});

  factory FavoriteEstateModel.fromJson(Map<String, dynamic> json){
    return FavoriteEstateModel(id: json['id'],
        propertyId: json['property_id'],
        userId: json['user_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
