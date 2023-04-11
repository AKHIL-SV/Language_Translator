import 'package:flutter/material.dart';

//===== key =====//
const String apiKey = '1a7836c8e7mshb5172e683cd1975p1259bdjsn052435532c46';
const String apiHost = 'google-translate1.p.rapidapi.com';
const String encodingType = 'application/json';
const String baseUrl =
    'https://google-translate1.p.rapidapi.com/language/translate/v2';
const String languagesEndpoint = '/languages?target=en';

//===== colors=====//

const Color kPrimaryColor = Color(0xFF131517);
const Color kSecondaryColor = Color(0xFF2C2E2F);
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
