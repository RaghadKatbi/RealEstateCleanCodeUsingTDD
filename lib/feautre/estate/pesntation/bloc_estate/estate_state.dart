part of 'estate_cubit.dart';

@immutable
sealed class EstateState {}

final class EstateInitial extends EstateState {}

final class EstateLoading extends EstateState {}

final class EstateSuccess extends EstateState {
  final List<Estate> estate;

  EstateSuccess({required this.estate});
}

final class EstateFailure extends EstateState {
  final String message;

  EstateFailure({required this.message});
}
