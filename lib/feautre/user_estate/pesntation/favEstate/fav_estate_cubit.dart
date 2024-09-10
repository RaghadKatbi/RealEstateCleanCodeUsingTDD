import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failer.dart';
import '../../domain/entity/favorite_estate.dart';
import '../../domain/usecase/get_all_estate_favorite_usecase.dart';

part 'fav_estate_state.dart';

class FavEstateCubit extends Cubit<FavEstateState> {
  final GetAllEstateFavoriteUseCase getAllEstateFavorite;
  FavEstateCubit({required this.getAllEstateFavorite}) : super(FavEstateInitial());
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
