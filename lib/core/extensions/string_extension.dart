import 'package:base_clean_arch/core/constants/enum_constans.dart';
import 'package:intl/intl.dart';

extension StringExtension on String? {
  String convertHtmlToString() {
    String? data = this;
    return Bidi.stripHtmlIfNeeded(data!);
  }

  String convertToRupiah() {
    if (this != null) {
      // delete .0000
      String value = this!;
      String clean = value.replaceZero4();
      // create convert rupiah
      final formatRupiah = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
      // convert to rupiah
      final rupiah = formatRupiah.format(double.parse(clean));

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }

  String replaceZero4() {
    String value = this!;
    String clean = value.replaceAll('.0000', '');
    return clean;
  }

  String replaceZero(String pattern) {
    String value = this!;
    String clean = value.replaceAll(pattern, '');
    return clean;
  }

  String convertToRupiahInt() {
    if (this != null) {
      // create convert rupiah
      final formatRupiah = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
      // convert to rupiah
      final rupiah = formatRupiah.format(double.parse(this!.toString()));

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }

  String? getFirstWordOfTitle() {
    List<String>? splitWord = this!.split(' ');
    String initial = '';
    for (var i = 0; i < splitWord.length; i++) {
      if (i < 2) {
        initial += splitWord[i][0];
      } else {
        break;
      }
    }
    String name = initial.toUpperCase();
    return name;
  }

  bool containsIgnoreCase(String? keyword) {
    if (this == null) {
      return false;
    } else {
      if (keyword == null) {
        return false;
      } else {
        return this!.toLowerCase().contains(keyword.toLowerCase());
      }
    }
  }

  ItemIdType convertToItemIdType() {
    switch (this) {
      case 'P':
        return ItemIdType.product;
      case 'C':
        return ItemIdType.category;
      default:
        return ItemIdType.sku;
    }
  }
}
