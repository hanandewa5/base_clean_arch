import 'package:base_clean_arch/core/utils/custom_date_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parse string date to full display date', () async {
    const String dateString = '2022-05-12T08:01:39.123+00:00';

    final String convertDate = CustomDateUtils.parseDateToFullDisplayDate(dateString);

    const String expected = 'Senin';
    expect(convertDate, expected);
  });

  test('String [dateCode] current date contains 8 characters', () async {
    final String stringDateTime = CustomDateUtils.dateCode();

    final int charCount = stringDateTime.length;

    const int expected = 8;
    expect(charCount, expected);
  });

  test('String [timeTransaction] current date contains 6 characters', () async {
    final String stringDateTime = CustomDateUtils.timeTransaction();

    final int charCount = stringDateTime.length;

    const int expected = 6;
    expect(charCount, expected);
  });

  test('String [dateUTCBuyItems] current date contains 6 characters', () async {
    final String stringDateTimeUTC = CustomDateUtils.dateUTCBuyItems();

    final int charCount = stringDateTimeUTC.length;
    final bool isCharCountInRange = charCount > 24 && charCount < 27;

    const bool expected = true;
    expect(isCharCountInRange, expected);
  });
}
