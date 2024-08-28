import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feautre/user_estate/data/model/estate_added_by_user_model.dart';

import '../../domain/usecase/add_my_estate_use_case.dart';

part 'user_estate_state.dart';

class UserEstateCubit extends Cubit<UserEstateState> {
  final AddMyEstateUseCase addMyEstateUseCase;
  UserEstateCubit({required this.addMyEstateUseCase}) : super(UserEstateInitial());
  void addMyEstate(EstateAddedByUserModel myEstate)async{

    try{
      emit(UserEstateLoadingMyAddEstate());
      final response =await addMyEstateUseCase(myEstate);
      response.fold(
            (failure) {
          emit(UserEstateFailureMyAddEstate());
        },
            (estate) {
          emit(UserEstateSuccessMyAddEstate());
        },
      );
    } catch(e){
      throw Exception(e);
    }

  }

}
