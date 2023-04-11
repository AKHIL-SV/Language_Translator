import 'dart:convert';

LanguageModel languageModelFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  LanguageModel({
    required this.data,
  });

  Data data;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.languages,
  });

  List<Language> languages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
      };
}

class Language {
  Language({
    required this.language,
    required this.name,
  });

  String language;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "name": name,
      };
}