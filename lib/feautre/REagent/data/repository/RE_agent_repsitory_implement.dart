import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/REagent/data/data_sources/data_sources_RE_agent.dart';
import 'package:real_estate/feautre/REagent/domain/entity/RE_agent.dart';
import 'package:real_estate/feautre/REagent/domain/repository/RE_agent_repository.dart';
import '../../../../core/network/network_info.dart';

class ReAgentRepsitoryImplement extends ReAgentRepository{
  final DataSourcesREAgent dataSourcesREAgent;
  final NetworkInfo networkInfo;

  ReAgentRepsitoryImplement({required this.dataSourcesREAgent, required this.networkInfo});
  @override
  Future<Either<Failure, List<ReAgent>>> getAllREAgent() async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesREAgent.getAllREAgent();
      return right(response);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<ReAgent>>> searchForREAgent(int cityId, int regionId, int neighborhoodId) async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesREAgent.searchForREAgent(cityId, regionId, neighborhoodId);
      return right(response);
    } else {
      return Left(OfflineFailure());
    }
  }

}