import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.activeIndex});

  final int activeIndex;

  void _onTap(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.blueAccent,
            padding: EdgeInsets.all(20),
            child: const Text('Screen Menu', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold))
          ),
          ListTile(
            title: const Text('YouTube'),
            selected: activeIndex == 0,
            onTap: () => _onTap(context, '/youtube')
          ),
          ListTile(
            title: const Text('Posts'),
              selected: activeIndex == 1,
              onTap: () => _onTap(context, '/posts')
          ),
          ListTile(
            title: const Text('Users'),
            selected: activeIndex == 2,
            onTap: () => _onTap(context, '/users')
          ),
          ListTile(
            title: const Text('Form Validation'),
            selected: activeIndex == 3,
            onTap: () => _onTap(context, '/form-validation')
          )
        ]
      )
    );
  }
}