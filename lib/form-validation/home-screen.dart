import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final data =  await rootBundle.loadString('assets/json/users.json');
    setState(() {
      _users = json.decode(data);
    });
  }

  void _onSearchUsers(String username) {
    if (username.isEmpty){
       _fetchUsers();
    } else {
      setState(() {
        _users = _users.where((user) => user['username'].contains(username)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: MediaQuery.of(context).padding.top + 20
        ),
        children: <Widget>[
          const Text('Hello, Hun Lihong', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          SearchBar(
            leading: Icon(Icons.search),
            hintText: 'Search username...',
            onChanged: _onSearchUsers
          ),
          const SizedBox(height: 20),
          if (_users.isEmpty)
            const Text('No user found')
          else
            ..._users.map((user) => Text(user['username'])),
        ]
      )
    );
  }
}