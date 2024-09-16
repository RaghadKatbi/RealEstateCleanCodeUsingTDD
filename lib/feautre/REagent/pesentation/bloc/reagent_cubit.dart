import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/core/error/function_error.dart';
import 'package:real_estate/feautre/REagent/domain/entity/RE_agent.dart';
import '../../domain/usecase/get_all_RE_agent_use_case.dart';
part 'reagent_state.dart';

class ReagentCubit extends Cubit<ReagentState> {
  GetAllReAgentUseCase reAgentUseCase;

  ReagentCubit({required this.reAgentUseCase}) : super(ReagentInitial());

  void getAllREAgent() async {
    print("Cubit");
    emit(ReagentLoading());
    final response = await reAgentUseCase();
    response.fold(
      (l) => emit(ReagentFailure(message: mapFailureToMessage(l))),
      (r) => emit(ReagentSuccess(rEAgent: r)),
    );
  }
}
