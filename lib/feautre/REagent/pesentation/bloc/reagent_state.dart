part of 'reagent_cubit.dart';

@immutable
sealed class ReagentState {}

final class ReagentInitial extends ReagentState {}

final class ReagentLoading extends ReagentState {}

final class ReagentSuccess extends ReagentState {
  // final List<REAgent> rEAgent;
  //
  // ReagentSuccess({required this.rEAgent});
}

final class ReagentFailure extends ReagentState {}