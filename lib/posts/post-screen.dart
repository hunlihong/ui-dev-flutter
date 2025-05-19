import 'package:flutter/material.dart';
import 'package:mad_1/posts/components/post-attachment.dart';
import 'package:mad_1/widgets/sidebar.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Posts', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: List.generate(20, (index) {
          return PostAttachment();
        })
      ),
      drawer: Sidebar(activeIndex: 1)
    );
  }
}