import 'package:flutter/material.dart';
import '../Models/comment_model.dart';
import 'comment_service.dart';

void main() {
  runApp(CommentsApp());
}

class CommentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comments and Replies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommentsScreen(),
    );
  }
}

class CommentsScreen extends StatelessWidget {
  Future<List<Comment>> _fetchComments() => CommentService.fetchComments();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments and Replies'),
      ),
      body: FutureBuilder<List<Comment>>(
        future: _fetchComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No comments found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final comment = snapshot.data![index];
                return ListTile(
                  title: Text(comment.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(comment.comment),
                      SizedBox(height: 8.0),
                      Text('Reply by ${comment.fanName}: ${comment.fanReply}'),
                      Text(
                          'Commented at: ${comment.createdAt}, Replied at: ${comment.replyCreatedAt}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
