part of 'user_estate_cubit.dart';

@immutable
sealed class UserEstateState {}

final class UserEstateInitial extends UserEstateState {}

final class UserEstateLoadingMyEstate extends UserEstateState {}

final class UserEstateSuccessMyEstate extends UserEstateState {
  final List<EstateAddedByUser> estateAddedByUser;

  UserEstateSuccessMyEstate({required this.estateAddedByUser});
}

final class UserEstateFailureMyEstate extends UserEstateState {
  final String message;

  UserEstateFailureMyEstate({required this.message});
}

final class UserEstateLoadingMyFavEstate extends UserEstateState {}

final class UserEstateSuccessMyFavEstate extends UserEstateState {
  final List<Estate> favoriteEstate;

  UserEstateSuccessMyFavEstate({required this.favoriteEstate});
}

final class UserEstateFailureMyFavEstate extends UserEstateState {
  final String message;

  UserEstateFailureMyFavEstate({required this.message});
}

final class UserEstateLoadingMyAddEstate extends UserEstateState {}

final class UserEstateSuccessMyAddEstate extends UserEstateState {
}

final class UserEstateFailureMyAddEstate extends UserEstateState {
  final String message;

  UserEstateFailureMyAddEstate({required this.message});
}
final class UserEstateSuccessSetOrUnSet extends UserEstateState {}
final class UserEstateFailureSetOrUnSet extends UserEstateState {
  final String message;

  UserEstateFailureSetOrUnSet({required this.message});

}
