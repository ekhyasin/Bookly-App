import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with api server');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with api server');

      case DioExceptionType.badResponse:
        return ServerFailure('Connection timeout with api server');

      case DioExceptionType.cancel:
        return ServerFailure.fromResponse(
            exception.response!.statusCode!, exception.response!.data);

      case DioExceptionType.connectionError:
        return ServerFailure('connectionError with api server');

      case DioExceptionType.unknown:
        return ServerFailure('Oops error, try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response)
  {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    }
    return ServerFailure('There was an error, Try again');
  }
}
