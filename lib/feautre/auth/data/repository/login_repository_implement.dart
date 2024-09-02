import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/auth/data/model/login_model.dart';
import 'package:real_estate/feautre/auth/domain/entities/login.dart';
import 'package:real_estate/feautre/auth/domain/repositories/login_repository.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/auth_remote_data_sources.dart';

class LoginRepositoryImplement implements LoginRepository {
  final AuthRemoteDataSources authRemoteDataSources;
  final NetworkInfo networkInfo;

  LoginRepositoryImplement(
      {required this.networkInfo, required this.authRemoteDataSources});

  @override
  Future<Either<Failure, LoginModel>> login(LogIn login) async {
    final LoginModel loginModel = LoginModel(
      phone: login.phone,
      password: login.password,
      token: login.token,
    );
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await authRemoteDataSources.login(loginModel);
        return right(remoteLogin);
      } on DioException catch(e){
        if(e.response.toString().contains('invalid_credentials'))
          {
            return left(PhoneOrPasswordUnCorrect());
          }
       else return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
