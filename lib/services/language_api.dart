import '../model/language_model.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';


class LanguageGet {
  Future<LanguageModel> getLanguages() async {
    var headers = {
      'Accept-Encoding': 'application/json',
      'X-RapidAPI-Key': ApiConstants.apiKey,
      'X-RapidAPI-Host': ApiConstants.apiHost
    };
    var client = http.Client();
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.languagesEndpoint);
    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var json = response.body;
        return languageModelFromJson(json);
      } else {
        throw Exception('Failed to load languages');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}