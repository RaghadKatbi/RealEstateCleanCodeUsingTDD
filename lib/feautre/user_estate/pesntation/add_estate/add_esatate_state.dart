part of 'add_esatate_cubit.dart';

@immutable
sealed class AddEsatateState {}

final class AddEsatateInitial extends AddEsatateState {}
final class UserEstateLoadingMyAddEstate extends AddEsatateState {}

final class UserEstateSuccessMyAddEstate extends AddEsatateState {
}

final class UserEstateFailureMyAddEstate extends AddEsatateState {
  final String message;

  UserEstateFailureMyAddEstate({required this.message});
}