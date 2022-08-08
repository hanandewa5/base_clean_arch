class CashierCloseException implements Exception {
  final String? message;
  final int? code;

  CashierCloseException({this.message, this.code});
}
