import 'package:dio/dio.dart';

import 'errore_model.dart';

class ServerException implements Exception {
  ServerException(ErrorModel errorModel);
}

class OffLineException implements Exception {}


 handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 401:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 403:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 404:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 409:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 422:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 504:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
      }
  }
}
