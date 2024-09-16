import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feautre/user_estate/data/model/estate_added_by_user_model.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';
import '../../../../core/error/failer.dart';
import '../../../../core/error/function_error.dart';
import '../../domain/entity/estate_added_by_user.dart';
import '../../domain/usecase/add_my_estate_use_case.dart';
import '../../domain/usecase/get_all_estate_added_by_user_usecase.dart';
import '../../domain/usecase/set_favorite_and_unset_usecase.dart';

part 'user_estate_state.dart';

class UserEstateCubit extends Cubit<UserEstateState> {
  final GetAllEstateAddedByUserUseCase getAllEstateUser;


  UserEstateCubit(
      {
      required this.getAllEstateUser})
      : super(UserEstateInitial());

  void getAllEstateAddedByUser()async{
    emit(UserEstateLoadingMyEstate());
    final response =await getAllEstateUser();
    response.fold(
          (failure) {
        emit(UserEstateFailureMyEstate(message: mapFailureToMessage(failure)));
      },
          (estate) {
        emit(UserEstateSuccessMyEstate(estateAddedByUser: estate));
      },
    );
  }
}
