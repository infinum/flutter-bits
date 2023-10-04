import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFormatter {
  const DateTimeFormatter(this._locale);

  final Locale _locale;

  String formatDayMonthLong(DateTime dateTime) {
    return DateFormat('dd. MMMM', _locale.toLanguageTag()).format(dateTime);
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy', _locale.toLanguageTag()).format(dateTime);
  }
}
