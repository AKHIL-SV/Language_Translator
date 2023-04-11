import 'package:flutter/material.dart';

//===== key =====//
const String apiKey = '7be1777aa3mshcaab042d403f000p1c3a18jsn4c2dd5a01324';
const String apiHost = 'google-translate1.p.rapidapi.com';
const String encodingType = 'application/json';
const String baseUrl =
    'https://google-translate1.p.rapidapi.com/language/translate/v2';
const String languagesEndpoint = '/languages?target=en';
const String detectEndpoint = '/detect';

//===== colors=====//

const Color kPrimaryColor = Color(0xFF131517);
const Color kSecondaryColor = Color(0xFF2C2E2F);
const Color kOrangeColor = Color(0xFFed533e);
const Color white = Colors.white;
//===== theme =====//

final theme = ThemeData(
  canvasColor: kPrimaryColor,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white10,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    counterStyle: const TextStyle(
      color: Colors.white38,
    ),
  ),
);
