import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/demo.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:photo_view/photo_view.dart';
import 'package:ecommerce/product1.dart';
import 'package:ecommerce/add.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(custdashboard());
}

class custdashboard extends StatefulWidget {
  final String p;
  const custdashboard(
      {Key key, this.p})
      : super(key: key);

  @override
  State<custdashboard> createState() => _custdashboardState();
}

class _custdashboardState extends State<custdashboard> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: shop(user:widget.p),
    );
  }
}
class shop extends StatefulWidget {
  final String user;
  const shop(
      {Key key, this.user})
      : super(key: key);

  @override
  _shopState createState() => _shopState();
}

class _shopState extends State<shop> {
  postTest() async {

    String info;
    var url = Uri.parse('http://192.168.0.129:8080/shop');

    var response =
    await http.post(url, body: {"phone":widget.user});
    var respStr = "";
    if (response.statusCode == 200) {
      print(response.body);
      print("rithal");
      if(response.body != "No shops are registered") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => dash(n: response.body, user: widget.user)),
        );
      } else {
        print("o");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => dash1(n: "No Shops are Registered", user: widget.user)),
        );
      }
    } else {
      info = "Error in response";
    }
  }
  @override
  Widget build(BuildContext context) {
    postTest();
    return Container(

    );
  }
}
class dash extends StatefulWidget {
  final String user,n;
  const dash(
      {Key key, this.n,this.user})
      : super(key: key);
  @override
  _dashState createState() => _dashState();
}

class _dashState extends State<dash> {
  //final textController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //var k= widget.user;
  @override
  Widget build(BuildContext context) {

    final  names = json.decode(widget.n) as List;
    print(widget.n);
    print(names[0]['ShopName']);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.yellow[50],
      appBar: myAppBar('DASHBOARD',context),
      drawer: myDrawer(context,widget.user),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.fromLTRB(5, 5, 5, 0),
                    height: 430,
                    width: 350,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          child:
                          PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),

                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          child: PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          child: PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          /*child: PhotoView(
                  imageProvider: NetworkImage("https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                )*/
                          child: PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
            // Container(height:100),
            //SizedBox(height: 20.0),
            Center(
              child: Text("Registered Shops",
                  style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:Colors.black,
                  )
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => add(p:widget.user,shop:names[index]['shoplicence'])),
                      );

                    },
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 3.0),
                          Container(
                            height: 50,
                            margin: EdgeInsets.all(2),
                            color: Colors.teal[50],
                            child: Center(
                                child: Text(
                                  '${names[index]['ShopName']}',
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ]
      ),
      bottomNavigationBar: bottom(context,widget.user),
    );
  }
}
class dash1 extends StatefulWidget {
  final String user,n;
  const dash1(
      {Key key, this.n,this.user})
      : super(key: key);
  @override
  _dash1State createState() => _dash1State();
}

class _dash1State extends State<dash1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.yellow[50],
      appBar: myAppBar('DASHBOARD',context),
      drawer: myDrawer(context, widget.user),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    height: 430,
                    width: 350,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          child:
                          PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(
                                0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),

                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          child: PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(
                                0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          child: PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(
                                0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 450,
                          height: 400,
                          color: Colors.white,
                          /*child: PhotoView(
                  imageProvider: NetworkImage("https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                )*/
                          child: PinchZoom(
                            image: Image.network(
                                "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                            zoomedBackgroundColor: Colors.black.withOpacity(
                                0.5),
                            resetDuration: const Duration(milliseconds: 100),
                            maxScale: 2.5,
                            onZoomStart: () {
                              print('Start zooming');
                            },
                            onZoomEnd: () {
                              print('Stop zooming');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
            // Container(height:100),
            //SizedBox(height: 20.0),
            Center(
              child: Text("Registered Shops",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),
            ),
            SizedBox(height: 10.0),
            Center(child: Text("${widget.n}",
              style: TextStyle(
                fontSize: 20,

              ),
            ),

            ),
          ]
      ),
      bottomNavigationBar: bottom(context, widget.user),
    );
  }
}