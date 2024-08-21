import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/feauter/auth/data/model/login_model.dart';
import 'package:real_estate/feauter/auth/data/model/register_model.dart';
import '../../../../core/error/failer.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUser;
  final RegisterUseCase registerUser;
  AuthCubit({required this.loginUser,required this.registerUser}) : super(AuthInitial());

  void login(String phone, String password) async {
    emit(LoginLoading());
    final response = await loginUser(
        LoginModel( phone: phone, password: password,token: '',));
    response.fold(
      (failure) {
        emit(LoginFailure(message: _mapFailureToMessage(failure)));
      },
      (token) {
        emit(LoginSuccess());
      },
    );
  }

  void register(String name,String phone, String password,String comfiremPassword) async {
    emit(RegisterLoading());
    final response = await loginUser(
        LoginModel( phone: phone, password: password,token: '',));
    response.fold(
          (failure) {
        emit(LoginFailure(message: _mapFailureToMessage(failure)));
      },
          (token) {
        emit(LoginSuccess());
      },
    );
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure :
        return "SERVER_FAILURE_MESSAGE";
      case OfflineFailure:
        return "OFFLINE_FAILURE_MESSAGE";
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
