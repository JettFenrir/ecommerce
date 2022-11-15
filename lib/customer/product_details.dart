import 'package:ecommerce/common/common.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/backend/connection.dart';
import 'package:quantity_input/quantity_input.dart';
class prod_details extends StatefulWidget {
  final  name,cost,desc,spec,delc,user,shop;
  const prod_details({Key key,this.name,this.cost,this.user,this.desc,this.spec,this.delc,this.shop}) : super(key: key);
  @override
  _prod_detailsState createState() => _prod_detailsState();
}
class _prod_detailsState extends State<prod_details> {
  var number=1;
  @override
  Widget _buildquoteTemplate() {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              image: NetworkImage("http://192.168.0.129:8080/getImage"),
              fit: BoxFit.fill,
            ),
            SizedBox(height: 6.0),
            Text(
              "NAME:${widget.name}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "DESCRIPTION :${widget.desc}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "SPECIFICATION:${widget.spec}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "COST:${widget.cost}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "DELIVERY COST:${widget.delc}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,40,240,20),
              child: QuantityInput(  elevation: 2,value: number,minValue: 1,maxValue: 1000, inputWidth: 50,buttonColor: Colors.grey[700],  onChanged:(value) =>number =int.parse(value),
              ),
            ),

            Row(
              children: [
                SizedBox(width: 20.0),
                RaisedButton(onPressed: (){
                   cart(widget.name,widget.cost,widget.user,widget.shop,number,widget.delc);
                },
                  child:Text("add to cart",
                    style: TextStyle(color: Colors.blue, fontSize: 30), ),
                ),
                SizedBox(width: 35.0),
                RaisedButton(onPressed: (){

                },
                  child:Text("buy now", style: TextStyle(color: Colors.blue, fontSize: 30),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar("${widget.name}", context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0.0),
              _buildquoteTemplate(),
              SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottom(context,"customer", widget.user),
    );
  }
}