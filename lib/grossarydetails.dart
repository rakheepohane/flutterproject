import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {

  String url = "https://grocery-second-app.herokuapp.com/api/category";
  var catArray = [];

  void initState(){
    super.initState();
    getData();

  }

  getData() async{
    var res= await http.get(Uri.parse("https://grocery-second-app.herokuapp.com/api/category"));
    // print(res.body);\
    var data;
    data=jsonDecode(res.body);
    print(data);

    catArray = data["data"];
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Grossary App"),
      ),
      body:Center(
          child: ListView.builder(itemBuilder:(context,index){
            return ListTile(
              title: Text(catArray[index]["catName"]),
              // leading: Image.network(catArray[index]["catImage"]),
              subtitle: Text("Id: ${catArray[index]["catId"]}"),
              trailing: Text(catArray[index]["slug"]),
            );
          },
            itemCount: catArray.length,)

      ),
    );
  }
}
