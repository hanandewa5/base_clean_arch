import 'package:meta_validator/meta_validator.dart';

class Validation {
  String? validateNotNull(String? value, fieldName) {
    if (value == '') {
      return '$fieldName tidak boleh kosong';
    } else {
      return null;
    }
  }

  bool checkDayIsApplied(int dayApplied) {
    const arr = [64, 32, 16, 8, 4, 2, 1];
    DateTime currentDate = DateTime.now();
    List<int> arrApplied = [];
    List<int> dayOfWeek = [];
    for (var i = 0; i < arr.length; i++) {
      if (dayApplied - arr[i] < 0) {
        continue;
      } else if (dayApplied - arr[i] == 0) {
        arrApplied.add(arr[i]);
        break;
      } else {
        arrApplied.add(arr[i]);
        dayApplied -= arr[i];
      }
    }
    for (var i = 0; i < arrApplied.length; i++) {
      switch (arrApplied[i]) {
        case 64:
          dayOfWeek.add(7);
          break;
        case 32:
          dayOfWeek.add(6);
          break;
        case 16:
          dayOfWeek.add(5);
          break;
        case 8:
          dayOfWeek.add(4);
          break;
        case 4:
          dayOfWeek.add(3);
          break;
        case 2:
          dayOfWeek.add(2);
          break;
        case 1:
          dayOfWeek.add(1);
          break;
        default:
          break;
      }
    }
    if (dayOfWeek.any((element) => element == currentDate.weekday)) {
      return true;
    } else {
      return false;
    }
  }

  // bool validateMinimalQuantity(PromotionEntities promotion, List<ItemCartEntities> item) {}

  // String? validateUsername(String name) {
  //   Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
  //   RegExp regex = new RegExp(pattern as String);
  //   if (!regex.hasMatch(name))
  //     return 'Username_invalid'.tr;
  //   else
  //     return null;
  // }

  // String? validateAlphabet(String? value, fieldName) {
  //   if (value == "") {
  //     return 'Field_empty'.trParams({'fieldName': fieldName});
  //   } else {
  //     Pattern alphabet = r'^[a-zA-Z -]+$';
  //     RegExp regex = new RegExp(alphabet as String);
  //     if (!regex.hasMatch(value!)) {
  //       return 'Field_must_be_alphabet'.trParams({'fieldName': fieldName});
  //     }
  //     return null;
  //   }
  // }

  // String? validateNumber(String value, fieldName) {
  //   if (value.isEmpty) {
  //     return 'Field_empty'.trParams({'fieldName': fieldName});
  //   } else {
  //     Pattern number = r'^(?=.*?[0-9]+.*)';
  //     RegExp regex = new RegExp(number as String);
  //     if (!regex.hasMatch(value)) {
  //       return 'Field_must_be_number'.trParams({'fieldName': fieldName});
  //     }
  //     return null;
  //   }
  // }

  // String? validateMultiLine(String value, fieldName) {
  //   if (value == "") {
  //     return 'Field_empty'.trParams({'fieldName': fieldName});
  //   } else {
  //     RegExp regExp = RegExp(r"\w+(\'\w+)?");
  //     if (regExp.allMatches(value).length > 200) {
  //       return 'Field_too_long'.trParams({'fieldName': fieldName});
  //     }
  //     return null;
  //   }
  // }

  // String? validatePassword(String password) {
  //   Pattern number = r'^(?=.*?[0-9]+.*)';
  //   Pattern alphabet = r'(?=.*?[a-zA-Z]+.*)';
  //   // Pattern character = r'(?=.*?[!@#\$&*~]+.*)';
  //   RegExp regex = new RegExp(number as String);

  //   if (password.isEmpty) {
  //     return 'Password_empty'.tr;
  //   } else if (password.length < 8) {
  //     return 'Password_too_short'.tr;
  //   } else {
  //     if (!regex.hasMatch(password)) {
  //       return 'Password_must_contain_numbers'.tr;
  //     } else {
  //       regex = new RegExp(alphabet as String);
  //       if (!regex.hasMatch(password)) {
  //         return 'Password_must_contain_alphabets'.tr;
  //       }
  //       return null;
  //     }
  //   }
  // }

  String? validateEmail(String? email) {
    String? validation = validateNotNull(email, 'Email');
    validation ??= StringValidator.validateEmail(email!) ? null : 'Format email salah';
    return validation;
  }

  String? validatePhoneNumber(String? phone) {
    String? validation = validateNotNull(phone, 'Telepon');
    validation ??= StringValidator.validatePhone(phone!) ? null : 'Format telepon salah';
    return validation;
    // Pattern firstLetterNumber = r'^(\+62|62|0)8';
    // Pattern sixChar = r'[0-9]{6}$';
    //
    // RegExp regex = RegExp(firstLetterNumber as String);
    // if (!regex.hasMatch(val)) {
    //   return 'Gunakan Telepon yang valid';
    // } else {
    //   regex = RegExp(sixChar as String);
    //   if (!regex.hasMatch(val)) {
    //     return 'Gunakan Telepon yang valid';
    //   }
    //   return null;
    // }
  }

  // String? validateDate(String? val) => val == "" ? 'Birthday_empty'.tr : null;

  // bool isValidDate(String input) {
  //   final date = DateTime.parse(input);
  //   final originalFormatString = toOriginalFormatString(date);
  //   return input == originalFormatString;
  // }

  // String toOriginalFormatString(DateTime dateTime) {
  //   final y = dateTime.year.toString().padLeft(4, '0');
  //   final m = dateTime.month.toString().padLeft(2, '0');
  //   final d = dateTime.day.toString().padLeft(2, '0');
  //   return "$y-$m-$d";
  // }
}
