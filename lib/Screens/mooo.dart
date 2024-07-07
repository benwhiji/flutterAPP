import 'package:flutter/material.dart';
import 'add_comment_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comments App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddCommentScreen(),
    );
  }
}
