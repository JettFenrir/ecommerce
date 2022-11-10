import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/common/common.dart';
import 'package:ecommerce/backend/connection.dart';
class productdetails extends StatefulWidget {
  final  name,cost,desc,spec,delc,user;
  const productdetails( {Key key,this.name,this.cost,this.desc,this.spec,this.delc,this.user}) : super(key: key);
  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
 String name,cost,desc,spec,delc;
  bool change=true,check=true;
  initState(){
     name=widget.name;
     cost=widget.cost;
     desc=widget.desc;
     spec=widget.spec;
     delc=widget.delc;
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
print(name+cost+spec+desc+delc);
    return Scaffold(
      appBar: myAppBar('DASHBOARD',context),
      body: (check==true)? ListView( scrollDirection: Axis.vertical,
        children:   [ ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(key:_formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image(
                      image: NetworkImage("http://192.168.0.129:8080/getImage"),
                      fit: BoxFit.fill,
                    ),

                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,
                              initialValue : name,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                name = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,
                              initialValue : desc,
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                desc= value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Specification:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,

                              initialValue : (spec!=" ") ?spec:"No specifications",
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                               spec = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cost:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,
                              initialValue : cost,
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                cost= value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery cost:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,

                              initialValue :   (delc!=" ") ?delc:"Free",
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                delc = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: (change == true)?Text(
                            'EDIT',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ):Text(
                            'SAVE',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),

                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {

                            print(change);
                            if(change==false){
                              _formKey.currentState.save();
                              editordeleteproduct(name,cost,spec,delc,desc,widget.user,"editfromproduct");
                            }
                            setState(() => {change = !change});

                          },
                        ),
                        SizedBox(width:20.0),
                        ElevatedButton(
                          child: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            editordeleteproduct(name,cost,spec,delc,desc,widget.user,"deletefromproduct");
                             setState(() => {check = !check});
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ):Center(child: Text("THE PRODUCT IS DELETED",
 style: TextStyle(
     color: Colors.red
     ),
 ),),
    );
  }

}