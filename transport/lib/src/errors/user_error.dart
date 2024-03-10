class UserError implements Exception {
  final String errorMsg;

  UserError(this.errorMsg);

  @override
  String toString() {
    return "UserException: $errorMsg";
  }
}
