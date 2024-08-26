import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_estate_state.dart';

class UserEstateCubit extends Cubit<UserEstateState> {
  UserEstateCubit() : super(UserEstateInitial());
}
