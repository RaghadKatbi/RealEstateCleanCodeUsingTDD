import 'package:real_estate/core/api/end_ponits.dart';
import 'package:real_estate/core/error/exptions.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';

import '../../../../core/api/api_consumer.dart';

abstract class DataSourcesEstate {
  Future<List<Estate>> getAllEstate();
  Future<List<Estate>> getAllEstateByType();
}

class DataSourcesEstateImplement implements DataSourcesEstate{
  final ApiConsumer api;

  DataSourcesEstateImplement({required this.api});
  @override
  Future<List<Estate>> getAllEstate() async {
   try{
     final response=await api.get(EndPoint.getByCity);
     return response['data'];
   } on ServerException{
     throw ServerException();
   }
  }

  @override
  Future<List<Estate>> getAllEstateByType() async {
    try{
      final response=await api.get(EndPoint.getByCityType);
      return response['data'];
    } on ServerException{
      throw ServerException();
    }
  }

}