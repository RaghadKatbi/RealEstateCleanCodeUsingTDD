import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failer.dart';
import '../../domain/entity/region.dart';
import '../../domain/usecase/region_useCase.dart';

part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  final RegionUseCase getAllRegions;
  RegionCubit({required this.getAllRegions}) : super(RegionInitial());
  void getAllRegion(int idCity) async {
    emit(RegionLoading());
    final response = await getAllRegions(idCity);
    response.fold(
          (failure) {
        print(failure);
        emit(RegionFailure(message: _mapFailureToMessage(failure)));
      },
          (region) {
        emit(RegionSuccess(region: region));
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
