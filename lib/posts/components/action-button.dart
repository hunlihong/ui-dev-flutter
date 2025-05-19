import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key, required this.title, required this.icon, required this.activeIcon, this.onPressed});

  final String title;
  final Icon icon, activeIcon;
  final VoidCallback? onPressed;

  @override
  State<StatefulWidget> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool _isActive = false;

  void _onPressedButton() {
    setState(() {
      _isActive = !_isActive;
    });
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          iconColor: Colors.black,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
        ),
        onPressed: _onPressedButton,
        child: Flex(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            _isActive ? widget.activeIcon : widget.icon,
            Text(_isActive && widget.title == 'Like' ? 'Liked' : widget.title, style: TextStyle(color: Colors.black))
          ]
        )
      )
    );
  }
}