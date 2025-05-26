import 'package:flutter/material.dart';

class FormControl extends StatefulWidget {
  const FormControl({super.key, required this.labelText, this.prefixIcon, this.suffixIcon, this.obscureText = false, this.controller});

  final String labelText;
  final Widget? prefixIcon, suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  State<FormControl> createState() => _FormControlState();
}


class _FormControlState extends State<FormControl> {
  @override
  void dispose() {
    widget.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${widget.labelText} is required';
        }
        return null;
      },
      controller: widget.controller,
      obscureText: widget.obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: Colors.black
          )
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: Colors.black
          )
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Colors.black
        ),
      )
    );
  }
}