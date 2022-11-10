import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:ecommerce/common/common.dart';
import 'package:ecommerce/shopkeeper/details_of_product.dart';
class dashboard extends StatefulWidget {
  final String license;
  final String products;
  const dashboard(
      {Key key, this.license,this.products})
      : super(key: key);
  @override
  State<dashboard> createState() => _dashboardState();
}
class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context)  {
    String user=widget.license;
    final  names=jsonDecode(widget.products);
    print(names.runtimeType);
    return Scaffold(
      appBar: myAppBar('DASHBOARD',context),
      drawer: myDrawer(context,"shopkeeper",user),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin:EdgeInsets.fromLTRB(5, 5, 5, 40),
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
                    ],),),
              ],),
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 45,
                child: Center(
                  child: Text(
                    'Product List', style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  ),
                )
            ),
            SizedBox(height:10,),
            (names.length>=0)? ListView.builder(
// scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => productdetails(name:names[index]["nameoftheproduct"],cost:names[index]["cost"],
                        desc:names[index]["description"],spec:names[index]["specification"], delc:names[index]["delivarycost"], user:user,
                        )),
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
                                  '${names[index]['nameoftheproduct']}',
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
                }):Text("no produts addded"),
          ]),
      bottomNavigationBar: bottom(context,"shopkeeper",user),
    );
  }
}
