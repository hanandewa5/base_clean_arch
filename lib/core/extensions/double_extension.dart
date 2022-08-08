import 'package:intl/intl.dart';

extension DoubleExtension on double? {
  String convertToRupiahInt() {
    if (this != null) {
      // create convert rupiah
      final formatRupiah = NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp ');
      // convert to rupiah
      final rupiah = formatRupiah.format(
        double.parse(this!.toString()),
      );

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }

  String convertToRupiahDecimal({int decimal = 0}) {
    if (this != null) {
      // create convert rupiah
      final formatRupiah = NumberFormat.currency(locale: 'id_ID', decimalDigits: decimal, symbol: 'Rp ');
      // convert to rupiah
      final rupiah = formatRupiah.format(
        double.parse(this!.toString()),
      );

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }
}
