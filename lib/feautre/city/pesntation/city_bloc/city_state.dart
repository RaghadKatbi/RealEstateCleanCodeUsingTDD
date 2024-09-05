part of 'city_cubit.dart';

@immutable
sealed class CityState {}

final class CityInitial extends CityState {}

final class CityLoading extends CityState {}

final class CitySuccess extends CityState {
  final List<City> city;

  CitySuccess({required this.city});
}

final class CityFailure extends CityState {
  final String message;

  CityFailure({required this.message});
}

