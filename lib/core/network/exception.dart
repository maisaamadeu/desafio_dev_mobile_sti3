class ServerException implements Exception {
  final String? message;
  ServerException({this.message}) : super();
}

class NoConnectionException implements Exception {
  final String message = 'No connection';
  NoConnectionException() : super();
}

class UnauthorizedException implements Exception {
  final String message = 'Unauthorized';
  UnauthorizedException() : super();
}

class ForbiddenException implements Exception {
  final String message = 'Forbidden';
  ForbiddenException() : super();
}

class NotFoundException implements Exception {
  final String message = 'Not found';
  NotFoundException() : super();
}
