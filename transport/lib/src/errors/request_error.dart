class RequestError implements Exception {
  final String errorMsg;

  RequestError(this.errorMsg);

  @override
  String toString() {
    return "UserException: $errorMsg";
  }
}
