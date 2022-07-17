class AppException implements Exception {
  late final _exceptionMessage;
  late final _prefix;

  AppException([this._exceptionMessage, this._prefix]);

  @override
  String toString() {
    return '$_exceptionMessage$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Reqeust");
}
