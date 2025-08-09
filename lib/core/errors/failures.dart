import 'package:dio/dio.dart';

abstract class Failures {
  final String message;
  Failures({required this.message});
}

class ServerFailures extends Failures {
  ServerFailures({required super.message});

  factory ServerFailures.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        final errorData = error.response?.data;
        final errorMessage =
            errorData is Map<String, dynamic> && errorData['error'] is String
                ? errorData['error']
                : 'Something went wrong';
        return ServerFailures(message: errorMessage);

      case DioExceptionType.cancel:
        return ServerFailures(message: 'Request to API server was cancelled');

      case DioExceptionType.connectionTimeout:
        return ServerFailures(message: 'Connection timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailures(
          message: 'Receive timeout in connection with API server',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailures(
          message: 'Send timeout in connection with API server',
        );

      case DioExceptionType.connectionError:
        return ServerFailures(message: 'Connection error with API server');

      case DioExceptionType.unknown:
        if (error.message?.contains('SocketException') ?? false) {
          return ServerFailures(message: 'No internet connection');
        }
        return ServerFailures(message: 'Unexpected error occurred');

      default:
        return ServerFailures(message: 'Oops something went wrong');
    }
  }
}
