import 'package:book_dub/screens/login/login.dart';
import 'package:book_dub/utils/our_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: OurLogin(),
    );
  }
}
