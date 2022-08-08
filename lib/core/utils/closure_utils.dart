
import 'package:base_clean_arch/core/utils/custom_date_utils.dart';

class ClosureUtils {
  /// Generate sales order number
  ///
  /// Returns [String] generated the sales order number for the sales order
  /// Require param [locationCode] and [registerCode]
  static String generateSalesorderNo(String locationCode, String registerCode) {
    final String date = CustomDateUtils.dateCode();
    final String time = CustomDateUtils.timeTransaction();

    return 'JP/$locationCode/$registerCode/$date/$time';
  }

  /// Generate return order number
  ///
  /// Returns [String] generated the return order number for the sales order
  /// Require param [locationCode] & [registerCode] & [closureId]
  static String generatePosreturnNo(String locationCode, String registerCode, int closureId) {
    final String date = CustomDateUtils.dateCode();
    final String time = CustomDateUtils.timeTransaction();

    return 'JP/$locationCode/$registerCode/RET/$closureId/$date/$time';
  }
}
