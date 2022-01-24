import 'package:flutter/material.dart';

class Errorcode extends StatefulWidget {
  const Errorcode({Key? key}) : super(key: key);

  @override
  _ErrorcodeState createState() => _ErrorcodeState();
}

class _ErrorcodeState extends State<Errorcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Grossary App"),
        ),
        body: Center(
          child: Text("Enter valid Email/Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.red),),
        ));
  }



}