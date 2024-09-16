part of 'set_favoriate_cubit.dart';

@immutable
sealed class SetFavoriateState {}

final class SetFavoriateInitial extends SetFavoriateState {}

final class UserEstateSuccessSetOrUnSet extends SetFavoriateState {
  final bool isFav;

  UserEstateSuccessSetOrUnSet({required this.isFav});
}

final class UserEstateFailureSetOrUnSet extends SetFavoriateState {
  final String message;

  UserEstateFailureSetOrUnSet({required this.message});
}
