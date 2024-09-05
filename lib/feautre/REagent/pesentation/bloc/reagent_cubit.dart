import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reagent_state.dart';

class ReagentCubit extends Cubit<ReagentState> {
  ReagentCubit() : super(ReagentInitial());
}
