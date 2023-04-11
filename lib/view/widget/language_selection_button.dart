import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider.dart';
import '../../model/language_model.dart';
import '../../services/language_api.dart';
import '../../constant.dart';

class LanguageSelectionButton extends StatefulWidget {
  const LanguageSelectionButton(
      {super.key, required this.buttonLabel, required this.isInputButton});
  final String buttonLabel;
  final bool isInputButton;

  @override
  State<LanguageSelectionButton> createState() =>
      _LanguageSelectionButtonState();
}

class _LanguageSelectionButtonState extends State<LanguageSelectionButton> {
  LanguageModel? languages;
  var _isloading = false;
  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  getLanguage() async {
    languages = await LanguageGet().getLanguages();
    if (languages != null) {
      setState(() {
        _isloading = true;
      });
    }
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, language, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kSecondaryColor,
            minimumSize: const Size(120, 40),
            maximumSize: const Size(120, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.84,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C2E2F),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'From',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: kSecondaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white70),
                                borderRadius: BorderRadius.circular(12)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white30),
                                borderRadius: BorderRadius.circular(12)),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'All Languages',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: _isloading
                            ? Builder(builder: (context) {
                                final lang = languages!.data;
                                final filteredLang = searchQuery.isEmpty
                                    ? lang.languages
                                    : lang.languages
                                        .where((language) => language.name
                                            .toLowerCase()
                                            .contains(searchQuery
                                                .trim()
                                                .toLowerCase()))
                                        .toList();
                                return ListView.separated(
                                  itemCount: filteredLang.length,
                                  itemBuilder: (context, index) {
                                    return Material(
                                      type: MaterialType.transparency,
                                      child: ListTile(
                                        tileColor: kPrimaryColor,
                                        selectedTileColor: kOrangeColor,
                                        selected: (widget.isInputButton &&
                                                filteredLang[index].name ==
                                                    language
                                                        .inputLanguage?.name) ||
                                            (!widget.isInputButton &&
                                                filteredLang[index].name ==
                                                    language
                                                        .outputLanguage?.name),
                                        title: Text(
                                          filteredLang[index].name,
                                          style: const TextStyle(
                                              color: Colors.white70),
                                        ),
                                        onTap: () {
                                          widget.isInputButton
                                              ? language.setInputLanguage(
                                                  filteredLang[index])
                                              : language.setOutputLanguage(
                                                  filteredLang[index]);
                                          searchQuery = '';
                                          Navigator.pop(context);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, index) =>
                                      const SizedBox(
                                    height: 15,
                                  ),
                                );
                              })
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: kOrangeColor,
                                ),
                              ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: Text(
            widget.buttonLabel,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
