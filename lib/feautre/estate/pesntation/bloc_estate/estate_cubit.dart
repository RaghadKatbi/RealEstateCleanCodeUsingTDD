import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failer.dart';
import '../../domain/entity/estate.dart';
import '../../domain/usecase/get_all_estate_usecase.dart';

part 'estate_state.dart';

class EstateCubit extends Cubit<EstateState> {
  final GetAllEstateUseCase getAllEstate;
  EstateCubit({required this.getAllEstate}) : super(EstateInitial());
  void getByCity(String nameCity) async {
    emit(EstateLoading());
    final response = await getAllEstate(nameCity);
    response.fold(
          (failure) {
        emit(EstateFailure(message: _mapFailureToMessage(failure)));
      },
          (estate) {
        emit(EstateSuccess(estate: estate));
      },
    );
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "SERVER_FAILURE_MESSAGE";
      case OfflineFailure:
        return "OFFLINE_FAILURE_MESSAGE";
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
