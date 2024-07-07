import 'package:flutter/material.dart';
import 'package:kaizer_chiefs/Services/comment.dart';
import 'package:kaizer_chiefs/splash_screen.dart';

import 'Screens/add_comment_screen.dart';
import 'Screens/comments_page.dart';
// Adjust this path based on your project structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaizer Chiefs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/add-comment': (context) => AddCommentScreen(),
        '/view-reply': (context) => CommentsPage(),
        '/allcoment': (context) => CommentsScreen()// Corrected route name
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kaizer Chiefs Assesment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add-comment');
              },
              child: Text('Add Comment'),
            ),
            SizedBox(height: 20), // Added spacing for clarity
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/view-reply');
              },
              child: Text('View & Reply comment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/allcoment');
              },
              child: Text('All comments & Reply'),
            ),
          ],
        ),
      ),
    );
  }
}
