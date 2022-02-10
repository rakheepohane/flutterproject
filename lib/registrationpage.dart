import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grossaryapp/registrationError.dart';
import 'package:http/http.dart' as http;


import 'loginpage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController  _name= TextEditingController();
  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();
  TextEditingController _phone= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Grossary App"),
      ),
      body: Center(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25,),
              Text("REGISTER HERE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Padding(
                padding: EdgeInsets.only(top: 25.0,right: 25,left: 25),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    labelText: "Name",
                  ),
                  controller: _name,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0,left: 25,right: 25),
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
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Password", labelText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0,left: 25,right: 25),
                child: TextField(
                  controller: _phone,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter Mobile Number", labelText: "Phone",
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(25.0),
                child: ElevatedButton(onPressed: (){
                  registeruser();
                },
                  child: Text("SIGN UP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registeruser() async {
    var url="https://grocery-second-app.herokuapp.com/api/auth/register";
    Map<String,String> headers ={
      "Content-Type" : "application/json",
    };

    var x =jsonEncode({
      'firstName':_name.text,
      'email':_email.text,
      'password': _password.text,
      'mobile':_phone.text,
    });
    // print("JSON DATA: ${mapeddata}");

    http.Response response = await http.post(Uri.parse(url),body: x,headers: headers);

    var data = jsonDecode(response.body);
    print("DATA: ${data}");

    var error= data["error"];


    if(error==false){

      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>  LoginPage()));
    }
    else {

      // Navigator.push(context, MaterialPageRoute(
      //     builder: (context) => Error()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Registration Failed...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ));

    }
  }


  }



