part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
final class DetailsLoading extends DetailsState {}
final class DetailsSuccess extends DetailsState {
  final Estate estate ;

  DetailsSuccess({required this.estate});

}
final class DetailsFailure extends DetailsState {
  final String message;

  DetailsFailure({required this.message});
}