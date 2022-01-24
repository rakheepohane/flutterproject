
import 'dart:convert';

import 'package:flutter/material.dart';
import 'registrationpage.dart';
import 'errorpage.dart';
import 'grossarydetails.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Grossary App"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25,),
              Text("LOGIN HERE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Email Address", labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0,left: 25,right: 25),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Password", labelText: "Password",
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 35.0),
                      child: ElevatedButton(onPressed: (){
                        login();
                      },
                        child: const Text("SIGN IN"),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: ElevatedButton(
                        onPressed:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const Register()));
                        },
                        child: const Text("SIGN UP"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }

  Future login() async {
    var url = Uri.parse("https://grocery-second-app.herokuapp.com/api/auth/login");

    Map<String,String> headers ={
      "Content-Type" : "application/json",
    };

    var x =jsonEncode({
      'email':_email.text,
      'password': _password.text,
    });
    var response=  await http.post(url, body: x,headers: headers);
    print('Response Status:${response.statusCode}');
    print('Response body:${response.body}');

    var data=jsonDecode(response.body);

    var error= data["error"];


    if(error==null){

      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>  JsonPage()));
    }
    else {
     // Navigator.push(context, MaterialPageRoute(
        //  builder: (context) =>  showErrorDialog(context)));
      Navigator.push(context, MaterialPageRoute(
    builder: (context) =>  Errorcode()));
      
    }

  }


}
