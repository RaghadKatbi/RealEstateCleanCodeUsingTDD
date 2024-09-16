import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reagent_search_state.dart';

class ReagentSearchCubit extends Cubit<ReagentSearchState> {
  ReagentSearchCubit() : super(ReagentSearchInitial());
}
