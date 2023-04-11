import 'package:flutter/material.dart';
import '../constant.dart';

class LanguageDetectionScreen extends StatelessWidget {
  LanguageDetectionScreen({super.key});
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
                controller: _inputController,
                cursorColor: kOrangeColor,
                minLines: 6,
                maxLines: 8,
                maxLength: 2300,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white60,
                ),
                onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
