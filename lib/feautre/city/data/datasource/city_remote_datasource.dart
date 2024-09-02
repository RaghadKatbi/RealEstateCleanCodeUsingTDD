import 'package:real_estate/core/api/end_ponits.dart';
import '../../../../core/api/api_consumer.dart';
import '../model/city_model.dart';

abstract class CityRemoteDatasource {

  Future<List<CityModel>> getAllCities();

}
class CityRemoteDatasourceImp implements CityRemoteDatasource{
  final ApiConsumer api;

  CityRemoteDatasourceImp({required this.api});
  @override
  Future<List<CityModel>> getAllCities() async {
      final response = await api.get(EndPoint.allCities);
      List<CityModel> cities = (response['data'] as List)
          .map((city) => CityModel.fromJson(city))
          .toList();
      print("+++++++++++++++++++++++++++++++++++");
      print(cities);
      return cities;
  }

}