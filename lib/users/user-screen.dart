import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mad_1/users/components/user-card.dart';
import 'package:mad_1/widgets/sidebar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UserState();
}

class _UserState extends State<UserScreen> {
  List<dynamic> _userList = [];

  void _setUserList(List<dynamic> userList) {
    setState(() {
      _userList = userList;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUserList();
  }

  Future<void> _fetchUserList() async {
    final String jsonUsers = await rootBundle.loadString('assets/json/users.json');
    final List<Map<String, dynamic>> users = jsonDecode(jsonUsers) as List<Map<String, dynamic>>;
    await Future.delayed(Duration(seconds: 3));
    _setUserList(users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users')
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _userList.isEmpty ? Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: Colors.blueAccent,
            size: 40
          )
        ) : ListView(
          padding: EdgeInsets.all(17),
          children: _userList.map((user) => UserCard(name: user['name'], username: user['username'], email: user['email'])).toList()
        )
      ),
      drawer: Sidebar(activeIndex: 2)
    );
  }
}