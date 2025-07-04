import 'package:flutter/material.dart';
import 'package:mad_1/form-validation/components/auth-card.dart';
import 'package:mad_1/form-validation/components/form-control.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<SignInScreen> {
  bool _isShow = true, _isValidatedKey = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggleIsShow() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  void _setIsValidatedKey(bool value) => setState(() {
    _isValidatedKey = value;
  });

  Future<void> _handleSignIn(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isSignedIn', true);
    Navigator.pushNamed(context, '/home');
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
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text('Sign In', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  FormControl(labelText: 'Email', controller: _usernameController, prefixIcon: Icon(Icons.email), formKey: _formKey, isValidatedKey: _isValidatedKey, setIsValidatedKey: _setIsValidatedKey),
                  FormControl(labelText:  'Password', controller: _passwordController, obscureText: _isShow, prefixIcon: Icon(Icons.lock), suffixIcon: IconButton(onPressed: _toggleIsShow, icon: _isShow ? Icon(Icons.visibility) : Icon(Icons.visibility_off)), formKey: _formKey),
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
                        if (_formKey.currentState!.validate() && _isValidatedKey) {
                          _handleSignIn(context);
                        }
                      },
                      child: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 16))
                    )
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/phone-verify'),
                  child: const Text('Forget password?', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                ),
                Flex(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    const Text('No account yet?'),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: const Text('Register', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
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