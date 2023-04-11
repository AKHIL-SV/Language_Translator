import 'package:flutter/material.dart';
import 'package:language_translator/view/home_page.dart';
import 'package:provider/provider.dart';
import 'constant.dart';
import 'controller/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
        title: 'Google Translator',
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}
