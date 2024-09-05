import 'package:real_estate/core/api/end_ponits.dart';
import 'package:real_estate/feautre/city/data/model/neighborhood_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/api/api_consumer.dart';
import '../model/city_model.dart';
import '../model/region_model.dart';

abstract class CityRemoteDatasource {

  Future<List<CityModel>> getAllCities();
  Future<List<RegionModel>> getAllRegion(int idCity);
  Future<List<NeighborhoodModel>> getAllNeighborhood(int idRegion);

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
      return cities;
  }

  @override
  Future<List<RegionModel>> getAllRegion(int idCity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response=await api.get(EndPoint.getAllRegion(idCity),queryParameters: {
      ApiKey.token:token  });
    List<RegionModel> region = (response['data'] as List)
        .map((reg) => RegionModel.fromJson(reg))
        .toList();
   return region;
  }

  @override
  Future<List<NeighborhoodModel>> getAllNeighborhood(int idRegion) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response=await api.get(EndPoint.getAllNeighborhood(idRegion),queryParameters: {
      ApiKey.token:token   });
    List<NeighborhoodModel> neighborhood = (response['data'] as List)
        .map((reg) => NeighborhoodModel.fromJson(reg))
        .toList();
    return neighborhood;
  }

}