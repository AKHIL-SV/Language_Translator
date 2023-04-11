import 'package:flutter/material.dart';
import 'package:language_translator/view/widget/language_selection_button.dart';
import '../constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Text Translation',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.white24,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    LanguageSelectionButton(buttonLabel: 'Translate \nFrom'),
                    Icon(
                      Icons.compare_arrows,
                      color: Colors.white60,
                    ),
                    LanguageSelectionButton(buttonLabel: 'Translate \nTo')
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Translate From ',
                      style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '(Select a language)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _inputController,
                  cursorColor: const Color(0xFFD4AF37),
                  minLines: 6,
                  maxLines: 8,
                  maxLength: 2300,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white60,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Translate From ',
                      style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '(Select a language)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  enabled: false,
                  controller: _outputController,
                  minLines: 6,
                  maxLines: 8,
                  maxLength: 2300,
                  cursorColor: const Color(0xFFD4AF37),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white60,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
