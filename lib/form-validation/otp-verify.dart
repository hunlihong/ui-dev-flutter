import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mad_1/form-validation/components/auth-card.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<OtpVerifyScreen> {
  String _inputCode = '';

  void _setInputCode(String code) {
    setState(() {
      _inputCode = code;
    });
  }

  void _onVerify(BuildContext context) {
    if (_inputCode.length == 6) {
      print(_inputCode);
      Navigator.pushNamed(context, '/home');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Form Validation')
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30),
        child: AuthCard(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Verify OTP Code', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
              SizedBox(height: 10),
              OtpTextField(
                borderWidth: 1,
                numberOfFields: 6,
                borderColor: Colors.black45,
                contentPadding: EdgeInsets.all(2),
                showFieldAsBox: true,
                fieldHeight: 35,
                fieldWidth: 35,
                onSubmit: _setInputCode
              ),
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
                  onPressed: () => _onVerify(context),
                  child: const Text('Verify', style: TextStyle(color: Colors.white, fontSize: 16))
                )
              )
            ]
          )
        )
      )
    );
  }
}