import 'package:flutter/material.dart';
import 'package:mad_1/form-validation/components/auth-card.dart';
import 'package:mad_1/form-validation/components/form-control.dart';

class PhoneVerifyScreen extends StatefulWidget {
  const PhoneVerifyScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<PhoneVerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();

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
                const Text('Input phone number to verify', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                SizedBox(height: 10),
                FormControl(labelText: 'Phone number', controller: _phoneNumberController, prefixIcon: Icon(Icons.phone)),
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
                        Navigator.pushNamed(context, '/otp-verify');
                      }
                    },
                    child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 16))
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}