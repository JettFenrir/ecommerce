import 'package:flutter/material.dart';
import 'backend/connection.dart';
import 'login.dart';
class change_password extends StatefulWidget {
 change_password({Key key ,this.user}) : super(key: key);
  final String user;

  @override
  _change_passwordState createState() => _change_passwordState();
}
class _change_passwordState extends State<change_password> {
  final TextEditingController _pass1controller = TextEditingController();
  final TextEditingController _pass2controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Change Password',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _pass1controller,
                    decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Enter New Password ',labelStyle: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    //maxLength: 12,
                    style:  TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                    keyboardType: TextInputType.emailAddress,

                  ),
                  SizedBox(height: 15,),
                 TextField(
                    controller: _pass2controller,
                    decoration: InputDecoration( focusColor:Colors.black, border: OutlineInputBorder(), labelText: 'Confirm Password',labelStyle: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    style:  TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 150,
                    color: Colors.black,
                    child: GestureDetector(
                      onTap:(){

                        if(!_pass1controller.value.text.isEmpty && !_pass2controller.value.text.isEmpty &&_pass1controller.value.text==_pass2controller.value.text)
                          {
                            change_pass(widget.user,_pass2controller.value.text);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password is changed')));
                            Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));

                          }
                        else{
                          if(!_pass1controller.value.text.isEmpty)
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password doesn't match")));

                          else
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter password")));

                        }
                      },
                      child: Center(
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}