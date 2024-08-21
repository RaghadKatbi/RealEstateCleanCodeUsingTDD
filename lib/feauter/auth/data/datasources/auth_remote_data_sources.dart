import 'package:real_estate/feauter/auth/data/model/login_model.dart';
import 'package:real_estate/feauter/auth/data/model/register_model.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/error/exptions.dart';

abstract class AuthRemoteDataSources {
  Future<LoginModel> login(LoginModel login);

  Future<RegisterModel> register(RegisterModel register);
}

class AuthRemoteDataSourcesDio implements AuthRemoteDataSources {
  final ApiConsumer api;

  AuthRemoteDataSourcesDio({required this.api});

  @override
  Future<LoginModel> login(LoginModel login) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
       queryParameters:{
          "phone":login.phone,
          "password":login.password
       }
      );
      final user = LoginModel.fromJson(response);
      return user;
    } on ServerException  {
     throw ServerException();
    }

  }

  @override
  Future<RegisterModel> register(RegisterModel register)async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKey.phone: register.phone,
          ApiKey.password: register.password,
          ApiKey.confirmPassword:register.confirmPassword,
          ApiKey.name:register.name
        },
      );
      final user = RegisterModel.fromJson(response);
      return user;
    } on ServerException  {
      throw ServerException();
    }
  }
}
