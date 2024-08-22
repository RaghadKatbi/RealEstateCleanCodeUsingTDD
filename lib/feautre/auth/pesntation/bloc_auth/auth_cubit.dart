import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failer.dart';
import '../../data/model/login_model.dart';
import '../../data/model/register_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUser;
  final RegisterUseCase registerUser;

  AuthCubit({required this.loginUser, required this.registerUser})
      : super(AuthInitial());

  void login(String phone, String password) async {
    emit(LoginLoading());
    final response = await loginUser(LoginModel(
      phone: phone,
      password: password,
      token: '',
    ));
    response.fold(
      (failure) {
        emit(LoginFailure(message: _mapFailureToMessage(failure)));
      },
      (token) {
        emit(LoginSuccess());
      },
    );
  }

  void register(String name, String phone, String password,
      String confirmPassword) async {
    emit(RegisterLoading());
    final response = await registerUser(RegisterModel(
        name: name,
        phone: phone,
        updatedAt: '',
        createdAt: '',
        id: 0,
        password: password,
        confirmPassword: confirmPassword));
    response.fold(
      (failure) {
        emit(RegisterFailure(message: _mapFailureToMessage(failure)));
      },
      (token) {
        emit(RegisterSuccess(user: RegisterModel.fromJson(token as Map<String, dynamic>) ));
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
