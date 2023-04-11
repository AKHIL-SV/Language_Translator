import 'package:flutter/material.dart';
import '../../model/language_model.dart';
import '../../services/language_api.dart';
import '../../constant.dart';

class LanguageSelectionButton extends StatefulWidget {
  const LanguageSelectionButton({super.key, required this.buttonLabel});
  final String buttonLabel;

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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
        minimumSize: const Size(120, 40),
        maximumSize: const Size(120, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 500,
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
                            borderSide: const BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white30),
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) {}),
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
                    child: ListView.separated(
                      itemCount: languages?.data.languages.length ?? 0,
                      itemBuilder: (context, index) {
                        return _isloading
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: kPrimaryColor,
                                ),
                                child: ListTile(
                                  title: Text(
                                    languages!.data.languages[index].name,
                                    style:
                                        const TextStyle(color: Colors.white70),
                                  ),
                                  onTap: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white60),
                              );
                      },
                      separatorBuilder: (ctx, index) => const SizedBox(
                        height: 15,
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
  }
}
