import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiUrl =
    'https://qmobile.qmart.co.za/chiefs-assessment-api/api/comments';

Future<List<dynamic>> fetchComments() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to load comments');
  }
}
