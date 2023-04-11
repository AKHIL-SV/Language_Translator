import '../model/language_model.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class LanguageGet {
  Future<LanguageModel> getLanguages() async {
    var headers = {
      'Accept-Encoding': encodingType,
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': apiHost
    };
    var client = http.Client();
    var url = Uri.parse(baseUrl + languagesEndpoint);
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var json = response.body;
        return languageModelFromJson(json);
      } else {
        throw Exception('Failed to load languages');
      }
    } catch (e) {
      throw Exception('e');
    }
  }
}
