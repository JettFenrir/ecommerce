

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Shopid());
}

class Shopid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var shopname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:SingleChildScrollView(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Container(
              child: Stack(
                children:<Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 120.0 , 0.0, 0.0),
                    child: Text(
                        'SHOP ID',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 70,left: 20,right: 20,bottom: 20),
              child: Column(

                children:<Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'SHOP ID',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.blueGrey[600])
                        )
                    ),
                  ),
                  SizedBox(height:20.0),



                  GestureDetector(
                    onTap: () {

                      print(shopname);

                    },
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );














  }
}
login(email,password) async{
//var respStr = "";
  var url = Uri.parse('http://192.168.0.12971:8081/sample');
  final http.Response response = await http.post(
      url,
      body://jsonEncode(<String, String>
      {
        'shopname'
      }
//  yrr tere mnifest mein problem hai pehle se hi
//  tune debug ke manifest ke saath chedkhaani ki kya??)?? nai bilkul nai net se uthau kya manifest?...nhi ruk..ek minmein send karati ohk n sun..woh copy paste mat karna pura
  );
//print("Respstr is "+response.body);
/*email= json.decode(response.body);
  password= json.decode(response.body);
  if (response.statusCode == 201) {
    respStr = response.body;
  } else {
    email = "Error in response";
    password = "Error in response";
  }
  print("Respstr is "+respStr);*/
  return jsonDecode(response.body);
}



