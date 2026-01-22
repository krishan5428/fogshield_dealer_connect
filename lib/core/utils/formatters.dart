import 'package:flutter/services.dart';

class AppFormatters {
  AppFormatters._();

  // Limits input to numbers only
  static TextInputFormatter get digitsOnly => FilteringTextInputFormatter.digitsOnly;

  // Limits input length (e.g., for phone numbers)
  static TextInputFormatter length(int max) => LengthLimitingTextInputFormatter(max);

  // Capitalizes first letter of each word
  static TextInputFormatter get capitalizeWords => _TitleCaseInputFormatter();
}

class _TitleCaseInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;

    final text = newValue.text;
    final words = text.split(' ');
    final capitalized = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');

    return newValue.copyWith(
      text: capitalized,
      selection: TextSelection.collapsed(offset: capitalized.length),
    );
  }
}