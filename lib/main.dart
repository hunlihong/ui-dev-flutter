import 'package:flutter/material.dart';
import 'package:mad_1/form-validation/home-screen.dart';
import 'package:mad_1/form-validation/otp-verify.dart';
import 'package:mad_1/form-validation/phone-number-verify.dart';
import 'package:mad_1/form-validation/register-screen.dart';
import 'package:mad_1/form-validation/sign-dart-screen.dart';
import 'package:mad_1/posts/post-screen.dart';
import 'package:mad_1/users/user-screen.dart';
import 'package:mad_1/youtube/youtube-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/sign-in',
      routes: {
        '/youtube': (context) => YouTubeScreen(),
        '/posts': (context) => PostScreen(),
        '/users': (context) => UserScreen(),
        '/sign-in': (context) => SignInScreen(),
        '/register': (context) => RegisterScreen(),
        '/phone-verify': (context) => PhoneVerifyScreen(),
        '/otp-verify': (context) => OtpVerifyScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}