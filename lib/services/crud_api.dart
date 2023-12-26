import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class CrudApi {
  static Future<dynamic> getRequest(Map<String, dynamic>? queryParams) async {
    try {
      var response = await http.get(
        Uri.https('newsapi.org', '/v2/top-headlines', queryParams),
      );
      if (response.statusCode == 200) {
        final jsonData = Map<String, dynamic>.from(jsonDecode(response.body));
        return jsonData['articles'];
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
