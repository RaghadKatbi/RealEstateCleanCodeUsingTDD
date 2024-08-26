import 'package:real_estate/core/api/end_ponits.dart';
import 'package:real_estate/core/error/exptions.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';

import '../../../../core/api/api_consumer.dart';
import '../model/estate_model.dart';

abstract class DataSourcesEstate {
  Future<List<Estate>> getAllEstate(String nameCity);
  Future<List<Estate>> getAllEstateByType();
}

class DataSourcesEstateImplement implements DataSourcesEstate{
  final ApiConsumer api;

  DataSourcesEstateImplement({required this.api});
  @override
  Future<List<Estate>> getAllEstate(String nameCity) async {
   try{
     final response=await api.get(EndPoint.getByCity(nameCity));
     List<EstateModel> Estate = await (response['data'] as List)
         .map((estate) => EstateModel.fromJson(estate))
         .toList();
     return Estate;
   } on ServerException catch (e) {
     throw Exception(e);
   }
  }

  @override
  Future<List<Estate>> getAllEstateByType() async {
    try{
      final response=await api.get(EndPoint.getByCityType);
      return response['data'];
    } on ServerException catch (e) {
      throw Exception(e);
    }
  }

}