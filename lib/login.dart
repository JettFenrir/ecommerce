import 'package:flutter/material.dart';
import 'package:ecommerce/registration/shopkeeper_registration.dart';
import 'package:ecommerce/registration/customer_registration.dart';
import 'package:ecommerce/backend/connection.dart' ;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {
  final _formKey=GlobalKey<FormState>();
  var email;
  var password;
  var type;
  var invalid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 130.0, 0.0, 0.0),
                        child: Text(
                            'App Name',
                            style: TextStyle(
                                fontSize: 55.0,
                                fontWeight: FontWeight.bold)
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 70, left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue : email,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged:(value){
                            email=value;
                          },
                          validator: (value){
                            if (value.isEmpty){
                              return 'Email address required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'EMAIL',
                              hintText: 'Enter your email id',
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors
                                      .blueGrey[600])
                              )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          initialValue : password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onChanged:(value){
                            password=value;
                          },

                          validator: (value){
                            if (value.isEmpty){
                              return 'Password required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'PASSWORD',
                              hintText: 'Enter your Password',
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors
                                      .blueGrey[600])
                              )
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Container(

                          alignment: Alignment(1.0, 0),
                          padding: EdgeInsets.only(top: 15, left: 0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                              }
                              );
                            },
                            child: Text('Forgot Password',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        GestureDetector(
                          onTap: () {
                              log_in(email,password,context);
                            },
                          child: Container(
                            height: 45,
                            child: Material(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.blue[800],
                              elevation: 7,
                              child: Center(
                                child: Text(
                                  'LOG IN',
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
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'New to this app?',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 13),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => customer_registration()));
                            },
                          child:
                          Text('Register for customer',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => BaseApp()));
                            },
                          child:
                          Text('Register for Shopkeeper',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }
}


