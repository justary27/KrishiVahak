class AuthError implements Exception {
  final String errorMsg;

  AuthError(this.errorMsg);

  @override
  String toString() {
    return "UserException: $errorMsg";
  }
}
