import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  const Error({Key? key}) : super(key: key);

  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Grossary App"),
        ),
        body: const Center(
          child: Text("Registration Unsuccessful!!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.red),),
        ));
  }



}