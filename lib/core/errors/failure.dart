import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the API server.');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the API server.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the API server.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to the API server was canceled.');

      case DioExceptionType.connectionError:
        if (dioException.message?.contains('SocketException') == true) {
          return ServerFailure('No internet connection.');
        }
        return ServerFailure('Unexpected error, please try again.');

      default:
        return ServerFailure('An unknown error occurred. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    String fallbackMessage = 'An error occurred with the server.';

    if (response is Map<String, dynamic>) {
      // Attempt to parse a more specific error message from the response body
      final errorMessage = response['error']?['message'] ??
          response['message'] ??
          'Server error - please try again later.';

      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(errorMessage);
      } else if (statusCode == 404) {
        return ServerFailure('Request not found - please try later.');
      } else if (statusCode == 500) {
        // Detailed message for 500 status code with fallback explanation
        return ServerFailure(errorMessage +
            '\nThe server encountered an internal error. Please try again later, or contact support if the issue persists.');
      } else {
        return ServerFailure(errorMessage);
      }
    } else {
      // Handle unexpected response format or lack of message
      return ServerFailure(
          'Server responded with status code $statusCode but did not provide further details. Please try again.');
    }
  }
}
