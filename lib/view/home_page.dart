import 'package:flutter/material.dart';
import 'package:language_translator/view/widget/language_selection_button.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../controller/provider.dart';
import '../model/translate_model.dart';
import '../services/translate_api.dart';
import 'language_detection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  translate(
      {required String inputText,
      required String outputLang,
      String inputLang = ""}) async {
    TranslatedModel response = await TranslateRequest().getTranslated(
        text: inputText, toLang: outputLang, fromLang: inputLang);
    final translatedText = response.data.translations[0].translatedText;
    setState(() {
      _outputController.text = translatedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Consumer<LanguageProvider>(
              builder: (context, language, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Text Translation',
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LanguageDetectionScreen(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.search_rounded,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LanguageSelectionButton(
                          buttonLabel: language.inputLanguage?.name ??
                              'Translate \nFrom',
                          isInputButton: true,
                        ),
                        const Icon(
                          Icons.compare_arrows,
                          color: Colors.white60,
                        ),
                        LanguageSelectionButton(
                          buttonLabel:
                              language.outputLanguage?.name ?? 'Translate \nTo',
                          isInputButton: false,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Translate From ',
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '(${language.inputLanguage?.name ?? 'Select a language'})',
                          style: const TextStyle(
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
                        cursorColor: kOrangeColor,
                        minLines: 5,
                        maxLines: 8,
                        maxLength: 2300,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white60,
                        ),
                        enabled: language.outputLanguage?.language != null,
                        onChanged: (value) {
                          if (language.outputLanguage?.language != null) {
                            translate(
                                inputText: value,
                                outputLang: language.outputLanguage!.language,
                                inputLang:
                                    language.inputLanguage?.language ?? "");
                          }
                        }),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Translate To ',
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '(${language.outputLanguage?.name ?? 'Select a language'})',
                          style: const TextStyle(
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
                      minLines: 5,
                      maxLines: 8,
                      maxLength: 2300,
                      cursorColor: const Color(0xFFD4AF37),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white60,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
