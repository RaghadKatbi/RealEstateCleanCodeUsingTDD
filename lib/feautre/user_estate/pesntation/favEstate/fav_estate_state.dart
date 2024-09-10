part of 'fav_estate_cubit.dart';

@immutable
sealed class FavEstateState {}

final class FavEstateInitial extends FavEstateState {}
final class UserEstateLoadingMyFavEstate extends FavEstateState {}

final class UserEstateSuccessMyFavEstate extends FavEstateState {
  final List<FavoriteEstate> favoriteEstate;

  UserEstateSuccessMyFavEstate({required this.favoriteEstate});
}

final class UserEstateFailureMyFavEstate extends FavEstateState {
  final String message;

  UserEstateFailureMyFavEstate({required this.message});
}
