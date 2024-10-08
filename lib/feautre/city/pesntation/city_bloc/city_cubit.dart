import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feautre/city/domain/entity/region.dart';
import '../../../../core/error/failer.dart';
import '../../../../core/error/function_error.dart';
import '../../domain/entity/city.dart';
import '../../domain/entity/neighborhood.dart';
import '../../domain/usecase/city_usecase.dart';
import '../../domain/usecase/neighborhood_useCase.dart';
import '../../domain/usecase/region_useCase.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final CityUseCase getAllCities;


  CityCubit(
      {required this.getAllCities,})
      : super(CityInitial());

  void getAllCity() async {
    emit(CityLoading());
    final response = await getAllCities();
    response.fold(
      (failure) {
        print(failure);
        emit(CityFailure(message: mapFailureToMessage(failure)));
      },
      (city) {
        emit(CitySuccess(city: city));
      },
    );
  }

}
