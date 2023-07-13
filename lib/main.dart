import 'package:flutter/material.dart';
import 'package:tribehire_assessment/screens/comments_screen.dart';
import 'package:tribehire_assessment/screens/posts_screen.dart';
import 'package:tribehire_assessment/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TribeHire Assessment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => const SplashScreen(),
        '/postsscreen': (context) => const PostsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/commentsscreen') {
          final int id = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => CommentsScreen(id: id),
          );
        }
        return null;
      },
    );
  }
}
