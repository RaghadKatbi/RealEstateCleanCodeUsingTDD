part of 'neighborhood_cubit.dart';

@immutable
sealed class NeighborhoodState {}

final class NeighborhoodInitial extends NeighborhoodState {}

final class NeighborhoodLoading extends NeighborhoodState {}
final class NeighborhoodSuccess extends NeighborhoodState {
  final List<Neighborhood> neighborhood;

  NeighborhoodSuccess({required this.neighborhood});
}

final class NeighborhoodFailure extends NeighborhoodState {
  final String message;

  NeighborhoodFailure({required this.message});
}