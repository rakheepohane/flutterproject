import 'package:flutter/material.dart';
import 'loginpage.dart';

void main(){
  runApp(GrossaryApp());
}

class GrossaryApp extends StatelessWidget {
  const GrossaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(),
    );
  }
}