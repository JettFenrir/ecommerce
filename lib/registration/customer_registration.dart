import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/login.dart';

import '../backend/connection.dart';

class customer_registration extends StatefulWidget {
  @override
  _customer_registrationState createState() => _customer_registrationState();
}

class _customer_registrationState extends State<customer_registration> {
  //final textController = new TextEditingController();

  String name;
  String phone;
  String email;
  String address;
  String password;
  String password2;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget _buildname(){
    return TextFormField(
      decoration: InputDecoration(  border: OutlineInputBorder(),labelText: ' Name ', hintText: 'enter name '),
      //maxLength: 30,
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return '*';
        }
        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }
  Widget _buildphone(){
    return TextFormField(
      decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Contact Number', hintText: 'enter your contact number'),
      //maxLength: 12,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return '*';
        }
        return null;

      },
      onSaved: (String value) {
        phone = value;
      },
    );
  }
  Widget _buildemail(){
    return TextFormField(
      decoration: InputDecoration(  border: OutlineInputBorder(),labelText: 'Email Address', hintText: 'enter your email id'),
      //maxLength: 30,
      validator: (String value) {
        if( !RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }
  Widget _buildaddress() {
    return TextFormField(
      decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Shipping Address'),
      //maxLength: 12,

      validator: (String value) {
        if (value.isEmpty) {
          return '*';
        }
        return null;
      },
      onSaved: (String value) {
        address = value;
      },
    );
  }
  Widget _buildpassword() {
    return TextFormField(
      decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'create password', hintText: 'enter new password'),
      //maxLength: 12,
      validator: (String value) {
        if (value.isEmpty) {
          return '*';
        }
        return null;
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 5.0,
            fontSize: 21.0,

            // fontSize: .0,
          ),
        ) ,
        backgroundColor:  Colors.teal[700],
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[ Text('Shopkeeper Registration',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2.0,

                      ),
                    ),
                    ],
                  ),

                  SizedBox(height: 20.0),
                  _buildname(),
                  SizedBox(height: 20.0),
                  _buildphone(),
                  SizedBox(height: 20.0),
                  _buildemail(),
                  SizedBox(height: 20.0),
                  _buildaddress(),
                  SizedBox(height: 20.0),
                  _buildpassword(),
                  SizedBox(height: 20.0),
                  //_buildpassword2(),

                ],
              ),),

          ),
          RaisedButton(
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onPressed: () {

              if (!_formKey.currentState.validate()) {
                return;
              }
              controller: _formKey.currentState.save();
              customerregistration(name,phone,email,address,password);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) =>  MyApp()));
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
              //Send to API
            },
          ),
        ],
      ),
    );
  }
}
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    // title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "Your data is sent for admin approval. Once it is approved u will be able access app. Thank you."),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme
            .of(context)
            .primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}