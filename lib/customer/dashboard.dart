import 'dart:convert';
import 'package:ecommerce/common/common.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:ecommerce/backend/connection.dart';
import 'package:ecommerce/customer/catagory.dart';
class dash extends StatefulWidget {
  final String user,shops;
  const dash(
      {Key key, this.shops,this.user})
      : super(key: key);
  @override
  _dashState createState() => _dashState();
}
class _dashState extends State<dash> {
  @override
  Widget build(BuildContext context) {
    final user=widget.user;
    final  names = json.decode(widget.shops);
    return Scaffold(
      appBar: myAppBar("Dashboard", context),
      drawer: myDrawer(context,"customer",user),
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
                    onTap: () async {
                      final catagory = await product_catagory(names[index]['shoplicence']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => advertise(user:widget.user,shop:names[index]['shoplicence'],cat_list:catagory)),
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
      bottomNavigationBar: bottom(context,"customer",widget.user),
    );
  }
}
