import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/shopkeeper/add_image.dart';
import 'package:ecommerce/common/common.dart';
import 'package:ecommerce/backend/connection.dart';
class addproduct extends StatefulWidget {
  final String user;
  const addproduct(
      {Key key, this.user})
      : super(key: key);
  @override
  _addproductState createState() => _addproductState();
}
class _addproductState extends State<addproduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _nameoftheproduct;
  String _catagory;
  String _searchkey;
  String _description;
  String _cost;
  String _specification;
  String _delivarycost;
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
      appBar: myAppBar('Add Product',context),
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
                  GestureDetector(
                    onTap: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      add_product(_nameoftheproduct,_catagory,_searchkey,_description,_cost,_specification,_delivarycost,widget.user);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => addimage(name: _nameoftheproduct,user:widget.user,)));
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





