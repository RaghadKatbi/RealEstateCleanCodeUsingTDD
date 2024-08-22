import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failer.dart';
import '../../data/model/city_model.dart';
import '../../domain/entity/city.dart';
import '../../domain/usecase/city_usecase.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final CityUseCase getAllCities;

  CityCubit({required this.getAllCities}) : super(CityInitial());

  void getAllCity() async {
    emit(CityLoading());
    final response = await getAllCities(CityModel(
      id: null,
      name: null,
      createdAt: null,
      updatedAt: null,
      cityImage: null,
    ));
    response.fold(
      (failure) {
        emit(CityFailure(message: _mapFailureToMessage(failure)));
      },
      (city) {
        emit(CitySuccess(city: city));
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
