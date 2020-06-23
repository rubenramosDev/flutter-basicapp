import 'package:flutter/material.dart';
import 'package:flutterchat/src/pages/login_page.dart';
import 'package:flutterchat/src/pages/sing_up_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full chat app',
      home: LoginPage(),
      routes: {
        "login":   (context) => LoginPage(),
        "sing_up": (context) => SingUpPage(),
      },
    );
  }
}
