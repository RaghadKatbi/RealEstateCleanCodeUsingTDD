import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:real_estate/core/api/dio_consumer.dart';
import 'package:real_estate/core/constance/save_token.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:real_estate/core/network/network_info.dart';
import 'package:real_estate/feautre/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:real_estate/feautre/auth/data/repository/login_repository_implement.dart';
import 'package:real_estate/feautre/auth/data/repository/register_repository_implementation.dart';
import 'package:real_estate/feautre/auth/domain/usecases/login_usecase.dart';
import 'package:real_estate/feautre/auth/domain/usecases/register_usecase.dart';
import 'package:real_estate/feautre/auth/pesntation/bloc_auth/auth_cubit.dart';
import 'package:real_estate/feautre/auth/pesntation/pages/login.dart';
import 'package:real_estate/feautre/city/data/datasource/city_remote_datasource.dart';
import 'package:real_estate/feautre/city/domain/usecase/city_usecase.dart';
import 'package:real_estate/feautre/city/pesntation/city_bloc/city_cubit.dart';
import 'package:real_estate/feautre/contact_us/data/datasources/data_Sources_Contact_us.dart';
import 'package:real_estate/feautre/contact_us/data/reposiyory/contact_us_repository.dart';
import 'package:real_estate/feautre/contact_us/domain/usecase/contact_usecase.dart';
import 'package:real_estate/feautre/contact_us/pesntation/bloc_contact/contact_us_cubit.dart';
import 'package:real_estate/feautre/estate/data/datasources/data_sources_estate.dart';
import 'package:real_estate/feautre/estate/data/repsitory/estate_repository_implement.dart';
import 'package:real_estate/feautre/estate/domain/usecase/get_all_estate_usecase.dart';
import 'package:real_estate/feautre/estate/domain/usecase/get_filter_estate_by_type_usecase.dart';
import 'package:real_estate/feautre/estate/pesntation/bloc_estate/estate_cubit.dart';
import 'package:real_estate/feautre/user_estate/data/datasources/data_sources_user_estate.dart';
import 'package:real_estate/feautre/user_estate/data/repository/use_estate_repository_implement.dart';
import 'package:real_estate/feautre/user_estate/domain/usecase/add_my_estate_use_case.dart';
import 'package:real_estate/feautre/user_estate/domain/usecase/get_all_estate_added_by_user_usecase.dart';
import 'package:real_estate/feautre/user_estate/domain/usecase/get_all_estate_favorite_usecase.dart';
import 'package:real_estate/feautre/user_estate/domain/usecase/set_favorite_and_unset_usecase.dart';
import 'package:real_estate/feautre/user_estate/pesntation/bloc_user_estate/user_estate_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/my_them/mythem.dart';
import 'feautre/city/data/repository/city_repository_implement.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'my_bottom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SaveToken saveToken = SaveToken();
  String? token = await saveToken.getToken();

  Widget homeScreen;
  if (token == "null") {
    homeScreen = LoginPage();
  } else {
    homeScreen = MyBottomNavigationBar(0, "A");
  }

  runApp(MyApp(homeScreen));
}

class MyApp extends StatelessWidget {
  final Widget homeScreen;
  const MyApp(this.homeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
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
        ),
        BlocProvider<CityCubit>(
            create: (_) => CityCubit(
                getAllCities: CityUseCase(
                    repository: CityRepositoryImplement(
                        networkInfo:
                            NetworkInfoImpl(InternetConnectionChecker()),
                        cityRemoteDataSources: CityRemoteDatasourceImp(
                            api: DioConsumer(dio: Dio())))))
              ..getAllCity()),
        BlocProvider<ContactUsCubit>(
          create: (_) => ContactUsCubit(
              contactUsUseCase: ContactUseCase(
                  repository: ContactUsRepositoryImplement(
                      networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                      dataSourcesContactUsImplement:
                          DataSourcesContactUsImplement(
                              api: DioConsumer(dio: Dio()))))),
        ),
        BlocProvider(
          create: (_) => EstateCubit(
              getAllEstate: GetAllEstateUseCase(
                  repository: EstateRepositoryImplement(
                      networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                      dataSourcesEstate: DataSourcesEstateImplement(
                          api: DioConsumer(dio: Dio())))),
              getFilterEstateByType: GetFilterEstateByTypeUseCase(
                  repository: EstateRepositoryImplement(
                      networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                      dataSourcesEstate: DataSourcesEstateImplement(
                          api: DioConsumer(dio: Dio()))))),
        ),
        BlocProvider(
          create: (_) => UserEstateCubit(
              addMyEstateUseCase: AddMyEstateUseCase(
                  repository: UserEstateRepositoryImplement(
                      networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                      dataSourcesUserEstate: DataSourcesUserEstateImplement(
                          api: DioConsumer(dio: Dio())))),
              getAllEstateUser: GetAllEstateAddedByUserUseCase(
                  repository: UserEstateRepositoryImplement(
                      networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                      dataSourcesUserEstate: DataSourcesUserEstateImplement(
                          api: DioConsumer(dio: Dio())))),
              getAllEstateFavorite: GetAllEstateFavoriteUseCase(
                  repository: UserEstateRepositoryImplement(
                      networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                      dataSourcesUserEstate: DataSourcesUserEstateImplement(
                          api: DioConsumer(dio: Dio())))),
              setFavoriteAndUnset: SetFavoriteAndUnsetUseCase(
                  repository: UserEstateRepositoryImplement(
                      networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                      dataSourcesUserEstate: DataSourcesUserEstateImplement(
                          api: DioConsumer(dio: Dio())))))
            ..getAllEstateAddedByUser(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'المحترف للعقار',
          theme: appTheme,
          home: AnimatedSplashScreen(
              splashIconSize: 200,
              duration: 3000,
              splash: Image.asset("asset/images/Artboard.png"),
              nextScreen: homeScreen,
              //: const MyBottomNavigationBar(0, "A"),
              curve: Curves.linear,
              splashTransition: SplashTransition.scaleTransition,
              backgroundColor: const Color(0xf0d0dae6))),
    );
  }
}
