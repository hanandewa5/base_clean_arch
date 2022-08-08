class TransactionUtils {
  List<double>? getSuggestMoney(double grandTotal) {
    List<double> arrSuggestedMoney = [];
    List<double> arr = [0];
    double element = 0;
    double surplusMoney = grandTotal % 100000;
    for (var i = 1; i <= 10; i++) {
      double amount = arr[i - 1] + 10000;
      arr.add(amount);
    }
    for (var index = 0; index < arr.length; index++) {
      element = arr[index];
      if (surplusMoney <= element) {
        break;
      }
    }

    arrSuggestedMoney.add(grandTotal + element - surplusMoney);
    double surplusMoney1 = arrSuggestedMoney[0] % 100000;
    if (surplusMoney1 == 0) {
      arrSuggestedMoney.add(0);
      arrSuggestedMoney.add(0);
    } else if (surplusMoney1 < 50000) {
      arrSuggestedMoney.add(arrSuggestedMoney[0] + 50000 - surplusMoney1);
      arrSuggestedMoney.add(arrSuggestedMoney[1] + 50000);
    } else {
      arrSuggestedMoney.add(arrSuggestedMoney[0] + 100000 - surplusMoney1);
      arrSuggestedMoney.add(0);
    }
    return arrSuggestedMoney.where((value) => value != 0).toList();
  }
}
