import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _users = [];
  Map<String, String> _mainUser = {'fullName': '', 'username': ''};

  @override
  void initState() {
    super.initState();
    _fetchUsers();
    _fetchMainUser();
  }

  Future<void> _fetchUsers() async {
    final data =  await rootBundle.loadString('assets/json/users.json');
    setState(() {
      _users = json.decode(data);
    });
  }

  Future<void> _fetchMainUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final String fullName = pref.getString('fullName') ?? 'No Name';
    final String username = pref.getString('username') ?? 'No username';

    setState(() {
      _mainUser = {'fullName': fullName, 'username': username};
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


  Future<void> _handleSignOut(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('isSignedIn');
    Navigator.pushNamed(context, '/sign-in');
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
          Text('Hello, ${_mainUser['fullName']}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(_mainUser['username']!, style: const TextStyle(fontSize: 17)),
          const SizedBox(height: 30),
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
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                side: BorderSide(
                  color: Colors.black
                )
              ),
              onPressed: () => _handleSignOut(context),
              child: const Text('Sign Out', style: TextStyle(color: Colors.white, fontSize: 16))
            )
          )
        ]
      )
    );
  }
}