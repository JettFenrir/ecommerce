import 'dart:convert';
import 'package:ecommerce/common/common.dart';
import 'package:ecommerce/customer/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/backend/connection.dart';
class shop_products extends StatefulWidget {
  final String prod_list,user,shop;
  const shop_products({Key key, this.prod_list ,this.user,this.shop}) : super(key: key);
  @override
  _shop_productsState createState() => _shop_productsState();
}
class _shop_productsState extends State<shop_products> {
  @override

  Widget _buildquoteTemplate() {
    final names = json.decode(widget.prod_list) as List;
    return
      ListView.builder(
          shrinkWrap: true,
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prod_details(name:names[index]["nameoftheproduct"],cost:names[index]["cost"],
                  desc:names[index]["description"],spec:names[index]["specification"], delc:names[index]["delivarycost"], user:widget.user,shop:widget.shop,
                )),);
              },
              title: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image(
                      image: NetworkImage("http://192.168.0.129:8080/getImage"),
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      '${names[index]["nameoftheproduct"]}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${names[index]["cost"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
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
      appBar: myAppBar('PRODUCTS',context),
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
      ), bottomNavigationBar: bottom(context,"customer",widget.user),
    );
  }
}