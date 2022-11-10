import 'package:ecommerce/backend/connection.dart';
import 'package:ecommerce/customer/productsofsamecatagory.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import'package:ecommerce/common/common.dart';
class advertise extends StatefulWidget {
  final String cat_list,user,shop;
  const advertise(
      {Key key,  this.cat_list,this.user,this.shop})
      : super(key: key);
  @override
  _advertiseState createState() => _advertiseState();
}
class _advertiseState extends State<advertise> {
  int counter=0;
  Widget _buildquoteTemplate() {
    final  names = json.decode(widget.cat_list) as List;
    return
      ListView.builder(
        // scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () async {

                final product_list = await products(names[index],widget.shop);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => shop_products(user:widget.user,shop:widget.shop,prod_list:product_list)),
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
                            '${names[index]}',
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
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: myAppBar('PRODUCT CATAGORY',context),
      body: Column(
        children: [
          SizedBox(height: 5.0),
          _buildquoteTemplate(),
        ],
      ),
       bottomNavigationBar: bottom(context,"customer",widget.user),
    );
  }
}