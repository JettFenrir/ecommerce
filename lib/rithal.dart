import 'package:flutter/material.dart';
import 'package:ecommerce/demo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
bool change=true;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(profile());
}

class profile extends StatefulWidget {
  final user;
  const profile({Key key,this.user}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  postTest() async {

    String info;
    var url = Uri.parse('http://192.168.0.129:8080/profile');
    var response = await http.post(url,body: { "phone":widget.user});

    print(response.body);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => profilepage(n:response.body,)));
  }

  @override
  Widget build(BuildContext context)
  { postTest();
  return Container(


  );
  }
}
class profilepage extends StatefulWidget {
  final String n;

  const profilepage({Key key,this.n}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}
class _profilepageState extends State<profilepage> {
  List names;
  //bool change;
//  get names => json.decode(widget.n) as List;
  @override
  void initState() {
    print("hello");print(change);
    names = json.decode(widget.n) as List;
    super.initState();
    //change =true ;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("My Profile",context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5,40,5,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  readOnly: change,
                  initialValue : names[0]["name"],

                  decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Name ',labelStyle: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                  //maxLength: 12,
                  style:  TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                  keyboardType: TextInputType.name,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '*';
                    }
                    return null;

                  },
                  // onSaved: (String value) {
                  //   names[0]["name"] = value;
                  // },
                ),


                SizedBox(height: 20.0),
                TextFormField(
                  readOnly: change,
                  initialValue : names[0]["email"],

                  decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Email',labelStyle: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                  //maxLength: 12,
                  style:  TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '*';
                    }
                    return null;

                  },
                  onSaved: (String value) {
                    names[0]["email"] = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  readOnly: change,
                  initialValue : names[0]["phone"],

                  decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Contact  ',labelStyle: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                  //maxLength: 12,
                  style:  TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '*';
                    }
                    return null;

                  },
                  onSaved: (String value) {
                    names[0]["phone"] = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  readOnly: change,
                  initialValue : names[0]["shipping"],

                  decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Sipping Address ',labelStyle: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                  //maxLength: 12,
                  style:  TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                  keyboardType: TextInputType.streetAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return '*';
                    }
                    return null;

                  },
                  onSaved: (String value) {
                    names[0]["address"] = value;
                  },
                ),
                SizedBox(height: 30.0),
                Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: (){
                      //change=!change;
                      setState(() => {change = !change});
                      print(change);
                    },
                    color: Colors.blue,
                    child: (change == true)?Text(
                      'EDIT',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ):Text(
                      'Okay',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),

                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}