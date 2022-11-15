import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/common/common.dart';
const List<String> list = <String>['Pending', 'Accepted', 'Shipped', 'Delivered'];
List dropdownvalue=[];
class orderlist extends StatefulWidget {
  final String user,order;
  const orderlist({Key key,this.user,this.order}) : super(key: key);
  @override
  State<orderlist> createState() => _orderlistState();
}
class _orderlistState extends State<orderlist> {
  List  order=[];
List<TableRow> rows =[];
  @override
  Widget tablecontent() {
   rows.clear();
     rows.add( TableRow(
       children: [Text("Product Name", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
         Text('Quantity', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
         Text("customer's info", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
         Text('cost', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
         Text('status', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
       ],
     ),);
     if(order.length!=null){
      for (int  i = 0; i < order.length; i++) {
        rows.add(TableRow(
          decoration: BoxDecoration(
              color: (dropdownvalue[i]=='Pending')?Colors.redAccent : (dropdownvalue[i]=='Accepted')?Colors.yellowAccent:
              (dropdownvalue[i]=='Shipped')?Colors.lightBlueAccent:(dropdownvalue[i]=='Delivered')?Colors.lightGreenAccent : Colors.white
          ),
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
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("${order[i]["cost"]}", textAlign: TextAlign.center)),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownvalue[i],
                  icon: const Icon(Icons.arrow_drop_down),
                  style: const TextStyle( color: Colors.black),
                  onChanged: (value) { setState(() {dropdownvalue[i] = value;});},
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
          ],
        ));
      }}

  }
  addselection(){
    dropdownvalue.clear();
    for(int i=0;i<order.length;i++)
      dropdownvalue.add(list.first);
  }
void initState(){
  order=jsonDecode(widget.order) as List;
  addselection();

}
  @override
  Widget build(BuildContext context) {
    tablecontent();
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