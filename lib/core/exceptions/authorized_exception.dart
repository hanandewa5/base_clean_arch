class AuthorizedException implements Exception {
  final String? message;
  final int? code;

  AuthorizedException({this.message, this.code});
}
