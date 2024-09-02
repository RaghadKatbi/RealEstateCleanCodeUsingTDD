import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failer.dart';
import '../../domain/entity/estate.dart';
import '../../domain/usecase/get_all_estate_usecase.dart';
import '../../domain/usecase/get_filter_estate_by_type_usecase.dart';

part 'estate_state.dart';

class EstateCubit extends Cubit<EstateState> {
  final GetAllEstateUseCase getAllEstate;
  final GetFilterEstateByTypeUseCase getFilterEstateByType;
  EstateCubit({required this.getFilterEstateByType,required this.getAllEstate}) : super(EstateInitial());
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
  void getFilterEstate(String type,String propose,String city) async {
    emit(EstateLoading());
    final response = await getFilterEstateByType(type,propose,city);
    response.fold(
          (failure) {
        emit(EstateFilterFailure(message: _mapFailureToMessage(failure)));
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
