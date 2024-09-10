import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failer.dart';
import '../../data/model/estate_added_by_user_model.dart';
import '../../domain/usecase/add_my_estate_use_case.dart';

part 'add_esatate_state.dart';

class AddEsatateCubit extends Cubit<AddEsatateState> {
  final AddMyEstateUseCase addMyEstateUseCase;
  AddEsatateCubit({required this.addMyEstateUseCase}) : super(AddEsatateInitial());
  void addMyEstate(EstateAddedByUserModel myEstate, File image,File video) async {
    try {
      emit(UserEstateLoadingMyAddEstate());
      final response = await addMyEstateUseCase(myEstate,image,video);
      response.fold(
            (failure) {
          emit(UserEstateFailureMyAddEstate(message: _mapFailureToMessage(failure)));
        },
            (estate) {
          emit(UserEstateSuccessMyAddEstate());
        },
      );
    } catch (e) {
      throw Exception(e);
    }
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
