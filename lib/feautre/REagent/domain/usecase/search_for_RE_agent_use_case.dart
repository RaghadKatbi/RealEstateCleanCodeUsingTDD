import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/REagent/domain/entity/RE_agent.dart';

import '../repository/RE_agent_repository.dart';

class SearchForReAgentUseCase {
  final ReAgentRepository repository;

  SearchForReAgentUseCase({required this.repository});

  Future<Either<Failure, List<ReAgent>>> call(
      int cityId, int regionId, int neighborhoodId) {
    return repository.searchForREAgent(cityId, regionId, neighborhoodId);
  }
}
