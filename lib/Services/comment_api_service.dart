import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> addComment(String name, String comment) async {
  final url = ' https://qmobile.qmart.co.za/chiefs-assessment-api/api/comments';

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'name': name,
      'comment': comment,
    }),
  );

  return response.statusCode == 200 || response.statusCode == 201;
}
