import 'package:ecommerce/change_password.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'backend/connection.dart';
class forget_password extends StatefulWidget {
  @override
  _forget_passwordState createState() => _forget_passwordState();
}
class _forget_passwordState extends State<forget_password> {
  bool submitValid = false;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  EmailAuth emailAuth;
  @override
  void initState() {
    super.initState();
    emailAuth = new EmailAuth(
      sessionName: "change password",
    );
  }
  void verify() async {
    bool result = emailAuth.validateOtp(
        recipientMail: _emailcontroller.value.text,
        userOtp: _otpcontroller.value.text) ;
    if(result)
    {
      print("change password");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => change_password(user:_emailcontroller.value.text)));
    }else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('INVALID OTP')));
    }
  }
void sendOtp() async {
    bool result=false;
    bool response =await check_email(_emailcontroller.value.text);
    if(response) {
      result = await emailAuth.sendOtp(
          recipientMail: _emailcontroller.value.text, otpLength:5);
    } else{
      print("EMAIL ISS NOT REGISTERED");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('INVALID EMAIL ADDRESS')));
    }
    if(result){
      setState(() {
        submitValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Change Password',style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Enter Email Address ',labelStyle: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    //maxLength: 12,
                    style:  TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                    keyboardType: TextInputType.emailAddress,

                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 50,
                    width: 150,
                    color: Colors.black,
                    child: GestureDetector(
                      onTap: sendOtp,
                      child: Center(
                        child: Text(
                          "Request OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  (submitValid)
                      ? TextField(
                    controller: _otpcontroller,
                    decoration: InputDecoration(  border: OutlineInputBorder(), labelText: 'Enter OTP',labelStyle: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    style:  TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                  )
                      : Container(height: 1),
                  (submitValid)
                      ? Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 150,
                    color: Colors.black,
                    child: GestureDetector(
                      onTap:(){ verify();},
                      child: Center(
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                      : SizedBox(height: 1)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}