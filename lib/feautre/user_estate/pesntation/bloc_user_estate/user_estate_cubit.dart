import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feautre/user_estate/data/model/estate_added_by_user_model.dart';
import 'package:real_estate/feautre/user_estate/domain/entity/favorite_estate.dart';
import '../../../../core/error/failer.dart';
import '../../domain/entity/estate_added_by_user.dart';
import '../../domain/usecase/add_my_estate_use_case.dart';
import '../../domain/usecase/get_all_estate_added_by_user_usecase.dart';
import '../../domain/usecase/get_all_estate_favorite_usecase.dart';
import '../../domain/usecase/set_favorite_and_unset_usecase.dart';

part 'user_estate_state.dart';

class UserEstateCubit extends Cubit<UserEstateState> {
  final AddMyEstateUseCase addMyEstateUseCase;
  final GetAllEstateAddedByUserUseCase getAllEstateUser;
  final GetAllEstateFavoriteUseCase getAllEstateFavorite;
  final SetFavoriteAndUnsetUseCase setFavoriteAndUnset;

  UserEstateCubit(
      {required this.addMyEstateUseCase,
      required this.getAllEstateUser,
      required this.getAllEstateFavorite,
      required this.setFavoriteAndUnset})
      : super(UserEstateInitial());

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

  void getAllEstateAddedByUser()async{
    emit(UserEstateLoadingMyEstate());
    final response =await getAllEstateUser();
    response.fold(
          (failure) {
        emit(UserEstateFailureMyEstate(message: _mapFailureToMessage(failure)));
      },
          (estate) {
        emit(UserEstateSuccessMyEstate(estateAddedByUser: estate));
      },
    );
  }

  void getFavoriteEstate() async {
    emit(UserEstateLoadingMyFavEstate());

    final response = await getAllEstateFavorite();
    response.fold(
          (failure) {
        emit(UserEstateFailureMyFavEstate(message: _mapFailureToMessage(failure)));
      },
          (estate) {
        emit(UserEstateSuccessMyFavEstate(favoriteEstate: estate ));
      },
    );
  }
  void setFavoriteEstate(int idEstate) async {
    final response = await setFavoriteAndUnset(idEstate);
    response.fold(
          (failure) {
            emit(UserEstateFailureSetOrUnSet(message: _mapFailureToMessage(failure)));
      },
          (unit) {
            emit(UserEstateSuccessSetOrUnSet());
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
