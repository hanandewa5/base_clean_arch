enum LoginStatus { success, failed, noConnection }

enum Languages { en, id }

enum ListMode { grid, list }

enum TransactionInputType { currency, percent }

enum NotificationType {
  updateItem,
  updateStock,
  updateLocation,
  updatePricebook,
  updateDiscount,
  updatePromotion,
  updateStruct,
  updateSetting,
  updatePaymentMethod,
  updateDiscountOutlet,
  updateTaxOutlet,
  broadcast,
  noConnection,
  cashierClosed,
  unauthorized,
}

enum CustomerType {
  pelanggan,
  semuaPelanggan,
  kategoriPelanggan,
}

enum CustomerCategory { walkinCustomer, newCustomer }

enum ItemIdType {
  product,
  category,
  sku,
}

enum PromotionType {
  minimalQuantity,
  buyXgetY,
  minimalTransaction,
  freeItemTransaction,
  member,
  voucher,
}

enum DiscountType {
  percetage,
  fixedAmount,
}

enum CreateOrderStatus {
  success,
  failed,
}

enum PaymentType {
  cash,
  debit,
  credit,
  eMoney,
  eWallet,
  others,
  payLater,
  storeCredit,
  qris,
}
