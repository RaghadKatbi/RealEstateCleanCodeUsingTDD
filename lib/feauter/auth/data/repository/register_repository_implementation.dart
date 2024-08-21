import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feauter/auth/data/model/register_model.dart';
import 'package:real_estate/feauter/auth/domain/entities/register.dart';
import 'package:real_estate/feauter/auth/domain/repositories/register_repository.dart';

import '../../../../core/network/network_info.dart';
import '../datasources/auth_remote_data_sources.dart';

class RegisterRepositoryImplementation implements RegisterRepository {
  final AuthRemoteDataSources authRemoteDataSources;
  final NetworkInfo networkInfo;

  RegisterRepositoryImplementation(
      {required this.authRemoteDataSources, required this.networkInfo});

  @override
  Future<Either<Failure, RegisterModel>> register(Register register) async {
    final RegisterModel registerModel = RegisterModel(
        name: register.name,
        phone: register.phone,
        updatedAt: register.updatedAt,
        createdAt: register.createdAt,
        id: register.id,
        password: register.password,
        confirmPassword: register.confirmPassword);
    if (await networkInfo.isConnected) {
      final remoteRegister =
          await authRemoteDataSources.register(registerModel);
      return right(remoteRegister);
    } else {
      return Left(OfflineFailure());
    }
  }
}
