import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:real_estate/core/api/dio_consumer.dart';
import 'package:real_estate/core/network/network_info.dart';
import 'package:real_estate/feautre/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:real_estate/feautre/auth/data/repository/login_repository_implement.dart';
import 'package:real_estate/feautre/auth/data/repository/register_repository_implementation.dart';
import 'package:real_estate/feautre/auth/domain/usecases/login_usecase.dart';
import 'package:real_estate/feautre/auth/domain/usecases/register_usecase.dart';
import 'package:real_estate/feautre/auth/pesntation/bloc_auth/auth_cubit.dart';
import 'package:real_estate/feautre/auth/pesntation/pages/login.dart';
import 'core/my_them/mythem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
              loginUser: LoginUseCase(
                  repository: LoginRepositoryImplement(
                      authRemoteDataSources: AuthRemoteDataSourcesDio(
                          api: DioConsumer(dio: Dio())),
                      networkInfo:
                          NetworkInfoImpl(InternetConnectionChecker()))),
              registerUser: RegisterUseCase(
                  repository: RegisterRepositoryImplementation(
                      authRemoteDataSources: AuthRemoteDataSourcesDio(
                          api: DioConsumer(dio: Dio())),
                      networkInfo:
                          NetworkInfoImpl(InternetConnectionChecker())))),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'المحترف للعقار',
        theme: appTheme,
        home: LoginPage(),
      ),
    );
  }
}
