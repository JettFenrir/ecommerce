import 'package:ecommerce/backend/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:core';
import'package:quantity_input/quantity_input.dart';
import 'package:ecommerce/common/common.dart';
class viewcart extends StatefulWidget {
  final String cart,user;
  const viewcart(
      {Key key,  this.cart,this.user})
      : super(key: key);
  @override
  _viewcartState createState() => _viewcartState();
}
class _viewcartState extends State<viewcart> {
  List <int> number=[];
  List new_list=[];
  List newlist=[];
  List names;
  final sel=[false,false];
  List checkSelection=[];
  int total =0;
  void initState() {
    names = json.decode(widget.cart) as List;
  }
  addSelection()
  {
    for(int i=0;i<names.length;i++) {
      checkSelection.add(false);
      number.add(int.parse(names[i]['quantity']));
    }
  }
  Widget _builditem (){
    return   (names.length>0) ?ListView.builder(
        shrinkWrap: true,
        itemCount: names.length,
        itemBuilder: (context,index){
         
          return ListTile(
            onTap: (){
              setState(() {
                sel.add(false);
                checkSelection[index]=!checkSelection[index];});
              if(checkSelection[index]==true)
              {
                total= (total+(int.parse(names[index]['cost'])*number[index]));
                new_list.add(names[index]);
              }
              else {
                total =( total-(int.parse(names[index]['cost'])*number[index]));
                new_list.removeAt(index);
              }
              },
            title: Card(
              color: Colors.teal[50],
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage("http://192.168.0.129:8080/getImage"),
                    alignment: Alignment.centerLeft,
                    width:130,
                    height:150,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed:(){ }, icon: checkSelection[index]? Icon(Icons.check_box, color:Colors.green, ): Icon(Icons.check_box_outline_blank_sharp, color:Colors.grey, ),
                        alignment: Alignment.center,    ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed:(){
                      if(checkSelection[index]) {
                        total = (total -
                            (int.parse(names[index]['cost']) * number[index]));
                      }                        newlist.add(names[index]);
                        setState(() =>( names.removeAt(index)));
                        deleteorplaceorder(newlist,"deletefromcart",widget.user);
                        }, icon: Icon(Icons.close, color:Colors.grey, ),
                        alignment: Alignment.center,    ),
                    ],
                  ),
                  Positioned(
                    left: 10,
                    right: 0,
                    top: 10,
                    child: Column(
                      children: [
                        Text("${names[index]['name']}\n₹${names[index]['cost']}  ",style: TextStyle(color: Colors.black87,fontWeight:  FontWeight.bold,fontSize: 20,),
                          textDirection: TextDirection.ltr ,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(240,40,0,20),
                          child: QuantityInput(  elevation: 2,value: number[index], inputWidth: 50,buttonColor: Colors.grey[700],
                              onChanged:(value){
                            if(checkSelection[index]){
                              if(int.parse(value)<=number[index]){
                                setState(() =>(total =( total-(int.parse(names[index]['cost'])*(int.parse(value)-1)))));
                              }
                              else   if(int.parse(value)>=number[index]){
                                setState(() =>(total =( total+(int.parse(names[index]['cost'])*(int.parse(value)-1)))));
                              }
                            }
                            number[index] =int.parse(value.replaceAll(',', ''));
                               },
          )
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    ):Center(child: Text("No Items found in Cart", style: TextStyle(color: Colors.red,fontSize: 20),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    addSelection();
    return  Scaffold(
      appBar:myAppBar('SHOPPING CART',context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _builditem(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.end ,
                  children: <Widget>[
                    Text('Total: \$' + total.toString() ,style: TextStyle(
                      fontSize: 20,
                    )),
                    SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () {  deleteorplaceorder(new_list,"placeorder",widget.user);},
                        elevation: 0.5,
                        color: Colors.red,
                        child: Center(
                          child: Text('Pay Now',),
                        ),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottom(context,"customer",widget.user),
    );
  }
}