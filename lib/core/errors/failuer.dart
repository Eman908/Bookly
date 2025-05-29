import 'package:dio/dio.dart';

abstract class Failuer {
  final String errMessage;
  const Failuer(this.errMessage);
}

class ServiceFailuer extends Failuer {
  ServiceFailuer(super.errMessage);
  factory ServiceFailuer.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailuer('Connection timeout. Please try again.');
      case DioExceptionType.sendTimeout:
        return ServiceFailuer('Send timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServiceFailuer('Receive timeout. Please try again.');
      case DioExceptionType.badCertificate:
        return ServiceFailuer('Invalid SSL certificate.');
      case DioExceptionType.badResponse:
        return ServiceFailuer.fromBadResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServiceFailuer('Request was cancelled.');
      case DioExceptionType.connectionError:
        return ServiceFailuer('No Internet connection.');
      case DioExceptionType.unknown:
        return ServiceFailuer('Unexpected error occurred. Please try again.');
    }
  }
  factory ServiceFailuer.fromBadResponse(
    int statusCode,
    Map<String, dynamic> response,
  ) {
    if (statusCode >= 400 && statusCode < 500) {
      return ServiceFailuer(response['error']['message']);
    } else if (statusCode >= 500) {
      return ServiceFailuer('Server error. Please try again later.');
    } else {
      return ServiceFailuer('Unexpected response error.');
    }
  }
}
