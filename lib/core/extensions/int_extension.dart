import 'package:base_clean_arch/core/constants/enum_constans.dart';
import 'package:intl/intl.dart';

extension IntegerExtension on int? {
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

  CustomerType convertToCustomerType() {
    switch (this) {
      case 1:
        return CustomerType.semuaPelanggan;
      case 2:
        return CustomerType.kategoriPelanggan;
      default:
        return CustomerType.pelanggan;
    }
  }

  CustomerCategory convertToCustomerCategory() {
    switch (this) {
      case -3:
        return CustomerCategory.walkinCustomer;
      default:
        return CustomerCategory.newCustomer;
    }
  }

  PromotionType convertToPromotionType() {
    switch (this) {
      case 1:
        return PromotionType.minimalQuantity;
      case 2:
        return PromotionType.buyXgetY;
      case 3:
        return PromotionType.minimalTransaction;
      case 4:
        return PromotionType.freeItemTransaction;
      case 5:
        return PromotionType.member;
      default:
        return PromotionType.voucher;
    }
  }

  DiscountType convertToDiscountType() {
    switch (this) {
      case 1:
        return DiscountType.percetage;
      default:
        return DiscountType.fixedAmount;
    }
  }

  PaymentType convertToPaymentType() {
    switch (this) {
      case 1:
        return PaymentType.cash;
      case 2:
        return PaymentType.debit;
      case 3:
        return PaymentType.credit;
      case 4:
        return PaymentType.eMoney;
      case 5:
        return PaymentType.eWallet;
      case 6:
        return PaymentType.others;
      case 7:
        return PaymentType.payLater;
      case 8:
        return PaymentType.storeCredit;
      default:
        return PaymentType.qris;
    }
  }
}
