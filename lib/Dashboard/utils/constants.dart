import 'package:flutter/material.dart';

class Constants {
  static const String APP_NAME = "Covid-19";

  // Color codes
  // ignore: non_constant_identifier_names
  static Color ACTIVE_COLOR_CODE = Colors.amberAccent[200];
  // ignore: non_constant_identifier_names
  static Color RECOVERED_COLOR_CODE = Colors.greenAccent[200];
  // ignore: non_constant_identifier_names
  static Color DEAD_COLOR_CODE = Colors.redAccent[200];

  // URLs
  static const String BASE_URL = 'https://corona.lmao.ninja/v2';
  static const String SUMMARY_URL = '$BASE_URL/all';
  static const String COUNTRIES_URL = '$BASE_URL/countries';
}
