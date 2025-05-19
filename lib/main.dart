import 'package:flutter/material.dart';
import 'package:mad_1/posts/post-screen.dart';
import 'package:mad_1/youtube/youtube-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/youtube',
      routes: {
        '/youtube': (context) => YouTubeScreen(),
        '/posts': (context) => PostScreen()
      },
    );
  }
}