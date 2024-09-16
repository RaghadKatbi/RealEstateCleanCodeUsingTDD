import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/function_error.dart';
import '../../domain/usecase/set_favorite_and_unset_usecase.dart';
import '../../domain/usecase/isFavUseCase.dart';
part 'set_favoriate_state.dart';

class SetFavoriateCubit extends Cubit<SetFavoriateState> {
  final SetFavoriteAndUnsetUseCase setFavoriteAndUnset;
  final isFavUseCase isFav;

  SetFavoriateCubit({
    required this.setFavoriteAndUnset,
    required this.isFav,
  }) : super(SetFavoriateInitial());

  void setFavoriteEstate(int idEstate) async {
    final response = await setFavoriteAndUnset(idEstate);
    response.fold(
      (failure) {
        emit(UserEstateFailureSetOrUnSet(
            message: mapFailureToMessage(failure)));
      },
      (isFav) {
        emit(UserEstateSuccessSetOrUnSet(
          isFav: isFav,
        ));
      },
    );
  }

  void isFavorite(int idEstate) async {
    final response = await isFav(idEstate);
    response.fold(
          (failure) {
        emit(UserEstateFailureSetOrUnSet(
            message: mapFailureToMessage(failure)));
      },
          (isFav) {
        emit(UserEstateSuccessSetOrUnSet(
          isFav: isFav,
        ));
      },
    );
  }
}
