import 'package:flutter/material.dart';
import 'package:mad_1/form-validation/components/auth-card.dart';
import 'package:mad_1/form-validation/components/form-control.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<RegisterScreen> {
  bool _isShow = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggleIsShow() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Form Validation')
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30),
        child: AuthCard(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Register', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                SizedBox(height: 10),
                FormControl(labelText: 'Full name', controller: _fullNameController, prefixIcon: Icon(Icons.perm_identity)),
                FormControl(labelText: 'Username', controller: _usernameController, prefixIcon: Icon(Icons.person)),
                FormControl(labelText: 'Phone number', controller: _phoneNumberController, prefixIcon: Icon(Icons.phone)),
                FormControl(labelText: 'Email', controller: _emailController, prefixIcon: Icon(Icons.email)),
                FormControl(labelText:  'Password', controller: _passwordController, obscureText: _isShow, prefixIcon: Icon(Icons.lock), suffixIcon: IconButton(onPressed: _toggleIsShow, icon: _isShow ? Icon(Icons.visibility) : Icon(Icons.visibility_off))),
                SizedBox(height: 10),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/phone-verify');
                      }
                    },
                    child: const Text('Register', style: TextStyle(color: Colors.white, fontSize: 16))
                  )
                ),
                SizedBox(height: 10),
                Flex(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    const Text('Already have an account?'),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/sign-in'),
                      child: const Text('Sign In', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                    )
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }
}