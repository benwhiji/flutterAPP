import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Screens/reply_screen.dart';
import '../Services/api_service.dart';


class CommentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No comments available.'));
          } else {
            List<dynamic> comments = snapshot.data!;
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return _buildCommentItem(context, comments[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildCommentItem(BuildContext context, Map<String, dynamic> comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(comment['name']),
          subtitle: Text(comment['comment']),
          onTap: () {
            _showCommentIdDialog(context, comment['id']);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton(
            onPressed: () {
              _handleReply(context, comment['id']);
            },
            child: Text('Reply'),
          ),
        ),
        Divider(),
      ],
    );
  }

  void _showCommentIdDialog(BuildContext context, int commentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Comment ID'),
          content: Text('The ID of this comment is: $commentId'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleReply(BuildContext context, int parentId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ReplyScreen(commentId: parentId),
      ),
    );
  }
}
