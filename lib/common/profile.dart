import 'package:flutter/material.dart';
import 'package:ecommerce/common/common.dart';
import 'dart:convert';
bool change=true;
class profilepage extends StatefulWidget {
  final String n,type,user;
  const profilepage({Key key,this.n,this.type,this.user}) : super(key: key);
  @override
  State<profilepage> createState() => _profilepageState();
}
class _profilepageState extends State<profilepage> {
  List names;
  @override
  void initState() {
    names = json.decode(widget.n) as List;
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("My Profile",context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5,40,5,0),
            child: Form(
              key: _formKey,
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
                    onSaved: (String value) {
                      names[0]["name"] = value;
                    },
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
                  (widget.type=="shopkeeper")?TextFormField(
                    readOnly: change,
                    initialValue : names[0]["shopname"],

                    decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Name of the Shop',labelStyle: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
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
                      names[0]["shopname"] = value;
                    },
                  ) : TextFormField(
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
                        _formKey.currentState.save();
                        setState(() => {change = !change});

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
            ),
          )
        ],
      ),
bottomNavigationBar: bottom(context,widget.type,widget.user),
    );
  }
}