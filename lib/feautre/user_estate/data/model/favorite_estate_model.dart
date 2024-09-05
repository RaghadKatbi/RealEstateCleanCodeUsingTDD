import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';

class FavoriteEstateModel extends FavoriteEstate {
  FavoriteEstateModel(
      {required super.id,
      required super.type,
      required super.purpose,
      required super.room,
      required super.status,
      required super.buildingRank,
      required super.license,
      required super.meterPrice,
      required super.userId,
      required super.bathroom,
      required super.price,
      required super.state,
      required super.space,
      required super.direction,
      required super.floor,
      required super.description,
      required super.numberShow,
      required super.streetWidth,
      required super.location,
      required super.features,
      required super.neighborhoodId,
      required super.estateImage,
      required super.estateVideo,
      required super.createdAt,
      required super.updatedAt});
  factory FavoriteEstateModel.fromJson(Map<String, dynamic> json) {
      return FavoriteEstateModel(
          id: json['id'],
          type: json['type'],
          purpose: json['purpose'],
          room: json['room'],
          bathroom: json['bathroom'],
          price: json['price'],
          state: json['state'],
          space: json['space'],
          direction: json['direction'],
          license: json['license'],
          floor: json['floor'],
          description: json['description'],
          numberShow: json['number_show'],
          meterPrice: json['meter_price'],
          streetWidth: json['street_width'],
          location: json['location'],
          features: json['features'],
          neighborhoodId: json['neighborhood_id'],
          userId: json['user_id'],
          estateImage: json['estate_image'],
          estateVideo: json['estate_video'],
          buildingRank: json['building_rank'],
          status: json['status_'],
          createdAt: DateTime.parse(json['created_at']),
          updatedAt: DateTime.parse(json['updated_at']),
      );
  }
}
