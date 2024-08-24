import 'package:dartz/dartz.dart';
import 'package:real_estate/core/error/failer.dart';
import 'package:real_estate/feautre/estate/data/datasources/data_sources_estate.dart';
import 'package:real_estate/feautre/estate/domain/entity/estate.dart';
import 'package:real_estate/feautre/estate/domain/repository/estate_repository.dart';

import '../../../../core/network/network_info.dart';

class EstateRepositoryImplement implements EstateRepository {
  final DataSourcesEstate dataSourcesEstate;
  final NetworkInfo networkInfo;

  EstateRepositoryImplement(
      {required this.dataSourcesEstate, required this.networkInfo});

  @override
  Future<Either<Failure, List<Estate>>> getAllEstate() async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesEstate.getAllEstate();
      return right(response);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Estate>>> getFilterEstateByType(
      String type, String purpose) async {
    if (await networkInfo.isConnected) {
      final response = await dataSourcesEstate.getAllEstateByType();
      return right(response);
    } else {
      return Left(OfflineFailure());
    }
  }
}
