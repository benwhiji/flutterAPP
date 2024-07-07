import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/comment_model.dart';

class CommentService {
  static const String url = 'https://qmobile.qmart.co.za/chiefs-assessment-api/api/comments';

  static Future<List<Comment>> fetchComments() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((data) => Comment.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
