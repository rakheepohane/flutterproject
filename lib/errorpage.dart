import 'package:flutter/material.dart';


class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Grossary App"),
        ),
        body: const Center(
          child: Text("Login Unsuccessfull!!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.red),),
        ));
  }

}






