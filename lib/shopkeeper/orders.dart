import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/common/common.dart';
class orderlist extends StatefulWidget {
  final String user,order;
  const orderlist({Key key,this.user,this.order}) : super(key: key);

  @override
  State<orderlist> createState() => _orderlistState();
}
class _orderlistState extends State<orderlist> {
  List<TableRow> rows = [ TableRow(
    children: [Text("Product Name", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      Text('Quantity', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
      Text("customer's informaion", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
      // Text('Status', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
    ],
  ),];
  int i;
  List  order=[];

  @override
  void initState() {
  order=jsonDecode(widget.order) as List;
    if(order.length!=null){
      for ( i = 0; i < order.length; i++) {
        rows.add(TableRow(
          key: UniqueKey(),
          children: [
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("${order[i]["name"]}", textAlign: TextAlign.center)),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("${order[i]["quantity"]}", textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("${order[i]["user"]}", textAlign: TextAlign.center),
            ),

          ],
        ));
      }}
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("order List",context),
      body: ListView(
          scrollDirection: Axis.vertical,

          children: <Widget>[
            (order.length>0) ?Table(
              border: TableBorder(verticalInside: BorderSide(width: 3, color: Colors.black, style: BorderStyle.solid),
                horizontalInside: BorderSide(width: 3, color: Colors.black, style: BorderStyle.solid),
                bottom: BorderSide(width: 3, color: Colors.black, style: BorderStyle.solid),
              ),
              children:rows,

            ):Center(child: Text("You did not recieved any order",style:TextStyle(color: Colors.red) ,)),
          ]),
      bottomNavigationBar: bottom(context,"shopkeeper",widget.user),
    );
  }
}