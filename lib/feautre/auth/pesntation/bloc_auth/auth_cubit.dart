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
        print("+++++++++++++++++++++++++++++++++");
        print(token);
        emit(LoginSuccess(token: token.token));
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
        emit(RegisterSuccess());
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    print(failure);
    switch (failure) {
      case ServerFailure _:
        return "حدثت مشكلة في السيرفر الرجاء المحاولة لاحقاَ";
      case OfflineFailure _:
        return "تأكد من اتصال جهازك بلانترنت";
      case PhoneOrPasswordUnCorrect _ :
        return "كلمة المرور غير متطابقة مع  رقم الهاتف ";
      case PhoneAlreadyUsedFailure _ :
        return "رقم الهاتف مستخدم مسبقاَ";
      default:
        return "خطأ غير متوقع حاول مرة أخرى";
    }
  }
}
