part of 'region_cubit.dart';

@immutable
sealed class RegionState {}

final class RegionInitial extends RegionState {}

final class RegionLoading extends RegionState {}


final class RegionSuccess extends RegionState {
  final List<Region> region;

  RegionSuccess({required this.region});
}

final class RegionFailure extends RegionState {
  final String message;

  RegionFailure({required this.message});
}