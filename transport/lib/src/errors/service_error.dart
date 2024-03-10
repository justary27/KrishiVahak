class ServiceError implements Exception {
  final String errorMsg;

  ServiceError(this.errorMsg);

  @override
  String toString() {
    return "UserException: $errorMsg";
  }
}
