import 'package:real_estate/core/api/end_ponits.dart';
import 'package:real_estate/feautre/REagent/data/model/RE_agent_model.dart';
import 'package:real_estate/feautre/REagent/domain/entity/RE_agent.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/constance/save_token.dart';

abstract class DataSourcesREAgent {
  Future<List<ReAgent>> getAllREAgent();
  Future<List<ReAgent>> searchForREAgent(int cityId,int regionId,int neighborhoodId);
}

class DataSourcesReAgentImplement extends DataSourcesREAgent{
  final ApiConsumer api;

  DataSourcesReAgentImplement({required this.api});
  @override
  Future<List<ReAgent>> getAllREAgent()async {
    SaveToken saveToken = SaveToken();
    String? token = await saveToken.getToken();
    final response =await api.get(EndPoint.agent,queryParameters: {
      ApiKey.token:token
    });
    List<ReAgentModel> REAgent = (response['data'] as List)
        .map((city) =>ReAgentModel.forJson(city))
        .toList();
    return REAgent;
  }

  @override
  Future<List<ReAgent>> searchForREAgent(int cityId, int regionId, int neighborhoodId) async {
    SaveToken saveToken = SaveToken();
    String? token = await saveToken.getToken();
    final responce = await api.get(EndPoint.searchForAgent,queryParameters: {
      ApiKey.token:token,
      "city_id":cityId,
      "region_id":regionId,
      "neighborhood_id":neighborhoodId
    });
    return responce;
  }

}