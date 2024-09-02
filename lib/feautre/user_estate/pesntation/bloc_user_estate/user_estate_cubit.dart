import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feautre/user_estate/data/model/estate_added_by_user_model.dart';
import '../../../estate/domain/entity/estate.dart';
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

  void addMyEstate(EstateAddedByUserModel myEstate) async {
    try {
      emit(UserEstateLoadingMyAddEstate());
      final response = await addMyEstateUseCase(myEstate);
      response.fold(
        (failure) {
          emit(UserEstateFailureMyAddEstate(message: failure.toString()));
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
        emit(UserEstateFailureMyEstate(message: failure.toString()));
      },
          (estate) {
        emit(UserEstateSuccessMyEstate(estateAddedByUser: estate));
      },
    );
  }

  void getFavoriteEstate() async {
    List<Estate> AllEstate = [];
    emit(UserEstateLoadingMyFavEstate());

    final response = await getAllEstateFavorite();
    response.fold(
          (failure) {
        emit(UserEstateFailureMyFavEstate(message: failure.toString()));
      },
          (estate) {
        List<Estate> filteredProperties = AllEstate.where((property) =>
            estate.any((favoriteProperty) => favoriteProperty.id == property.id)).toList();

        emit(UserEstateSuccessMyFavEstate(favoriteEstate: filteredProperties));
      },
    );
  }
  void setFavoriteEstate(int idEstate) async {
    final response = await setFavoriteAndUnset(idEstate);
    response.fold(
          (failure) {
            emit(UserEstateFailureSetOrUnSet(message: failure.toString()));
      },
          (unit) {
            emit(UserEstateSuccessSetOrUnSet());
      },
    );
  }
}
