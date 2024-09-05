import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failer.dart';
import '../../domain/entity/neighborhood.dart';
import '../../domain/usecase/neighborhood_useCase.dart';

part 'neighborhood_state.dart';

class NeighborhoodCubit extends Cubit<NeighborhoodState> {
  final NeighborhoodUseCase getAllNeighborhoods;
  NeighborhoodCubit({required this.getAllNeighborhoods}) : super(NeighborhoodInitial());

  void getAllNeighborhood(int idRegion) async {
    emit(NeighborhoodLoading());
    final response = await getAllNeighborhoods(idRegion);
    response.fold(
          (failure) {
        print(failure);
        emit(NeighborhoodFailure(message: _mapFailureToMessage(failure)));
      },
          (Neighborhood) {
        emit(NeighborhoodSuccess(neighborhood: Neighborhood));
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
