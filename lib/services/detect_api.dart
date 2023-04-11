import '../model/detect_model.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class DetectRequest {
  Future<DetectLanguageModel> getDetected({required String text}) async {
    var headers = {
      'Accept-Encoding': encodingType,
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': apiHost,
      'content-type': 'application/x-www-form-urlencoded'
    };

    var url = Uri.parse(baseUrl + detectEndpoint);
    var request = http.Request('POST', url);
    request.bodyFields = {
      'q': text,
    };
    request.headers.addAll(headers);
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var json = await response.stream.bytesToString();
        return detectLanguageModelFromJson(json);
      } else {
        throw Exception('Failed to detect');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
