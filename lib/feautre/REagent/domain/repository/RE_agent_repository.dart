import 'package:dartz/dartz.dart';
import 'package:real_estate/feautre/REagent/domain/entity/RE_agent.dart';

import '../../../../core/error/failer.dart';

abstract class ReAgentRepository {
  Future<Either<Failure,List<ReAgent>>> getAllREAgent();
  Future<Either<Failure,List<ReAgent>>> searchForREAgent(int cityId,int regionId,int neighborhoodId);
}