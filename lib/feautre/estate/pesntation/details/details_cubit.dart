import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';

import '../../../../core/error/failer.dart';
import '../../domain/usecase/get_esatate.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetEstateUseCase getEstateUseCase;
  DetailsCubit({required this.getEstateUseCase}) : super(DetailsInitial());
  void getEstate(int idEstate) async {
    emit(DetailsLoading());
    final response = await getEstateUseCase(idEstate);
    response.fold(
          (failure) {
        emit(DetailsFailure(message: _mapFailureToMessage(failure)));
      },
          (estate) {
        emit(DetailsSuccess(estate: estate));
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
