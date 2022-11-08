import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:ecommerce/product_image.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(App());


class App extends StatefulWidget {
  final String v;
  const App(
      {Key key, this.v})
      : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(license:widget.v),

    );
  }
}

class ProfilePage extends StatefulWidget {
  final String license;
  const ProfilePage(
      {Key key, this.license})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _nameoftheproduct;
  String _catagory;
  String _searchkey;
  String _description;
  String _cost;
  String _specification;
  String _delivarycost;
  File _pickedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildnameoftheproduct() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'product name',
      ),
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {

          labelText: 'product name *';

          return ('');

        }
        return null;
      },
      onSaved: (String value) {
        _nameoftheproduct = value;
      },
    );
  }
  Widget _buildcatagory() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Catagory of the Product'),
      validator: (String value) {
        if (value.isEmpty) {
          return ' Product Catagory is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _catagory = value;
      },
    );
  }
  Widget _buildsearchkey() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Search key(word to be used for search)'),
      validator: (String value) {
        if (value.isEmpty) {
          return ' Search Key is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _searchkey = value;
      },
    );
  }
  Widget _builddescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Add Description of the Product'),

      validator: (String value) {
        if (value.isEmpty) {
          return ' Description is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  } Widget _buildcost() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Add selling Price in Ruppees'),

      validator: (String value) {
        if (value.isEmpty) {
          return 'Adding Cost is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _cost = value;
      },
    );
  } Widget _buildspecification() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Add Specification of Product (if any)'),
      validator: (String value) {
        if (value.isEmpty) {
          return null;
        }
        return null;
      },
      onSaved: (String value) {
        _specification = value;
      },
    );
  } Widget _builddelivarycost() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Add Delivery Charges(if any)'),

      validator: (String value) {
        if (value.isEmpty) {
          return  null;
        }
        return null;
      },
      onSaved: (String value) {
        _delivarycost = value;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        title: Text('Add Your Product  ',
          style: TextStyle(
            color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              letterSpacing: 2.0
          ),
        ),
        centerTitle: true,

      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children:[
                  SizedBox(height: 20.0),
                  _buildnameoftheproduct(),
                  SizedBox(height: 15.0),

                  _buildcatagory(),
                  SizedBox(height: 15.0),
                  _buildsearchkey(),
                  SizedBox(height: 20.0),
                  SizedBox(height: 15.0),
                  _builddescription(),
                  SizedBox(height: 15.0),
                  _buildcost(),
                  SizedBox(height: 15.0),
                  _buildspecification(),
                  SizedBox(height: 15.0),
                  _builddelivarycost(),
                  SizedBox(height: 15.0),


                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      log(_nameoftheproduct,_catagory,_searchkey,_description,_cost,_specification,_delivarycost,widget.license);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => MyAppp(name: _nameoftheproduct,l:widget.license,)));
                    },

                    child: Container(
                      height: 45,
                      child: Material(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.blue[800],
                        elevation: 7,

                        child: Center(
                          child: Text(
                            'save and proceed',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),

                      ),

                    ),
                  ),
                ],
              ),
            ),
          ],),
      ),
    );

  }
}

void log(nameoftheproduct,catagory,searchkey,description,cost,specification,delivarycost,license)  async {
    String info;
    //final file = await _formkey;

    var url = Uri.parse('http://192.168.0.129:8080/product');

    var response =
        await http.post(url, body: {"nameoftheproduct":nameoftheproduct,"catagory":catagory,"searchkey":searchkey,"description":description,"cost":cost,"specification":specification,"delivarycost":delivarycost,"license":license});

    var respStr = "";

    info = json.decode(response.body);
    print(respStr);
    if (response.statusCode == 201) {

      respStr = response.body;

    } else {
      info = "Error in response";
    }
    return jsonDecode(respStr);
  }



