part of 'user_estate_cubit.dart';

@immutable
sealed class UserEstateState {}

final class UserEstateInitial extends UserEstateState {}

final class UserEstateLoadingMyEstate extends UserEstateState {}

final class UserEstateSuccessMyEstate extends UserEstateState {}

final class UserEstateFailureMyEstate extends UserEstateState {}

final class UserEstateLoadingMyFavEstate extends UserEstateState {}

final class UserEstateSuccessMyFavEstate extends UserEstateState {}

final class UserEstateFailureMyFavEstate extends UserEstateState {}

final class UserEstateLoadingMyAddEstate extends UserEstateState {}

final class UserEstateSuccessMyAddEstate extends UserEstateState {}

final class UserEstateFailureMyAddEstate extends UserEstateState {}
