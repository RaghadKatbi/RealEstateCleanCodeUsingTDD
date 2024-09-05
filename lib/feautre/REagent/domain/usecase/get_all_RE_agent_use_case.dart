import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/REagent/domain/entity/RE_agent.dart';
import 'package:real_estate/feautre/REagent/domain/repository/RE_agent_repository.dart';

import '../../../../core/error/failer.dart';

class GetAllReAgentUseCase{
  final ReAgentRepository repository;

  GetAllReAgentUseCase({required this.repository});
  Future<Either<Failure,List<ReAgent>>> call() async {
    return await repository.getAllREAgent();
  }

}