import 'package:flutter/material.dart';
import '../constant.dart';
import '../services/detect_api.dart';

class LanguageDetectionScreen extends StatefulWidget {
  const LanguageDetectionScreen({super.key});

  @override
  State<LanguageDetectionScreen> createState() =>
      _LanguageDetectionScreenState();
}

String language = 'Language';

class _LanguageDetectionScreenState extends State<LanguageDetectionScreen> {
  final TextEditingController _inputController = TextEditingController();

  detect({required String inputText}) async {
    final response = await DetectRequest().getDetected(text: inputText);
    final detectedLanguage = response.data.detections[0].language;
    setState(() {
      language = detectedLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Language Detector',
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        language = 'Language';
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white54,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.white24,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        language,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                        onChanged: (value) {
                          if (value.length >= 5) {
                            detect(inputText: value);
                          } else {
                            setState(() {
                              language = 'Type...';
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
