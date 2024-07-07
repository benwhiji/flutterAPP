import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Services/api_service.dart';

import 'comments_page.dart';

class ReplyScreen extends StatefulWidget {
  final int commentId;

  ReplyScreen({required this.commentId});

  @override
  _ReplyScreenState createState() => _ReplyScreenState();
}

class _ReplyScreenState extends State<ReplyScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();

  Future<void> _submitReply(BuildContext context) async {
    final String apiUrl =
        'https://main--chiefskazer.netlify.app/.netlify/functions/server/api/comments/${widget.commentId}/reply';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fan_name': _nameController.text,
        'fan_reply': _replyController.text,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reply posted successfully')),
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => CommentsPage()),
              (Route<dynamic> route) => false,
        );
      });
    } else {
      // Handle error case if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reply posted successfully')),
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => CommentsPage()),
              (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reply to Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            TextField(
              controller: _replyController,
              decoration: InputDecoration(labelText: 'Enter your reply'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitReply(context),
              child: Text('Submit Reply'),
            ),
          ],
        ),
      ),
    );
  }
}
