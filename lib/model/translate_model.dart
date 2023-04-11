import 'dart:convert';

TranslatedModel translatedModelFromJson(String str) =>
    TranslatedModel.fromJson(json.decode(str));

String translatedModelToJson(TranslatedModel data) =>
    json.encode(data.toJson());

class TranslatedModel {
  TranslatedModel({
    required this.data,
  });

  Data data;

  factory TranslatedModel.fromJson(Map<String, dynamic> json) =>
      TranslatedModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.translations,
  });

  List<Translation> translations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class Translation {
  Translation({
    required this.translatedText,
    required this.detectedSourceLanguage,
  });

  String translatedText;
  String detectedSourceLanguage;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        translatedText: json["translatedText"],
        detectedSourceLanguage: json["detectedSourceLanguage"],
      );

  Map<String, dynamic> toJson() => {
        "translatedText": translatedText,
        "detectedSourceLanguage": detectedSourceLanguage,
      };
}
