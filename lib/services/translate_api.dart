import '../model/translate_model.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class TranslateRequest {
  Future<TranslatedModel> getTranslated(
      {required String text, required String toLang, String? fromLang}) async {
    var headers = {
      'Accept-Encoding': encodingType,
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': apiHost,
      'content-type': 'application/x-www-form-urlencoded'
    };

    var url = Uri.parse(baseUrl);
    var request = http.Request('POST', url);
    request.bodyFields = {
      'q': text,
      'target': toLang,
      'source': fromLang ?? ''
    };
    request.headers.addAll(headers);
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var json = await response.stream.bytesToString();
        return translatedModelFromJson(json);
      } else {
        throw Exception('Failed to translate');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
