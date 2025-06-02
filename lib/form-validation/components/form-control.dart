import 'package:flutter/material.dart';

class FormControl extends StatefulWidget {
  const FormControl({super.key, required this.labelText, this.prefixIcon, this.suffixIcon, this.obscureText = false, this.controller, this.formKey, this.isValidatedKey = false, this.setIsValidatedKey});

  final String labelText;
  final Widget? prefixIcon, suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final GlobalKey<FormState>? formKey;
  final bool? isValidatedKey;
  final Function(bool value)? setIsValidatedKey;

  @override
  State<FormControl> createState() => _FormControlState();
}


class _FormControlState extends State<FormControl> {
  String _errorText = '';

  void _setFieldError(String value) {
    setState(() {
      _errorText = value;
    });
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          onChanged: (value) {
            final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (widget.labelText == 'Email') {
              if (!emailRegex.hasMatch(value)) {
                _setFieldError('Invalid email format');
                widget.setIsValidatedKey?.call(false);
              } else {
                _setFieldError('');
                widget.setIsValidatedKey?.call(true);
              }
            }
          },
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
            errorStyle: TextStyle(fontSize: 12, color: Colors.redAccent),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: Colors.black
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.only(left: 12, top: 3),
          child: Text(_errorText, style: TextStyle(fontSize: 12, color: Colors.red))
        )
      ]
    );
  }
}