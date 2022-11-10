import 'package:ecommerce/shopkeeper/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/shopkeeper/orders.dart';
import 'package:ecommerce/backend/connection.dart';
import 'package:ecommerce/shopkeeper/Add_product.dart';
import 'package:ecommerce/common/profile.dart';
import 'package:ecommerce/customer/dashboard.dart';
import 'package:ecommerce/customer//cart.dart';
import 'package:ecommerce/registration/register_to_shops.dart';

import '../login.dart';
//Drawer(menu)
Widget myDrawer(context,type,user){
  return Drawer(
    backgroundColor: Colors.black,
    child: SingleChildScrollView(
        child:Container(
            margin:EdgeInsets.only(top:50),
            child:Column(children: <Widget>[

              (type=="shopkeeper")? ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading:Icon(Icons.add),
                  title:Text("ADD MORE PRODUCTS"),
                  onTap:(){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => addproduct(user:user)));
                  }
              ): ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading:Icon(Icons.add),
                  title:Text("REGISTER MORE SHOPS"),
                  onTap:(){
                   showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildreg(user,context);
                      },
                    );
                  }
              ),
              (type=="shopkeeper")? ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading:Icon(Icons.update),
                  title:Text("Update Order Details"),
                  onTap:(){
                     }
              ): ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading:Icon(Icons.track_changes),
                  title:Text("Track Order"),
                  onTap:(){
                  }
              ),
              ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  leading:Icon(Icons.access_time_filled),
                  title:Text("Past Orders"),
                  onTap:(){
                    // My Pfofile button action
                  }
              ),
              ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  leading:Icon(Icons.person),
                  title:Text("LOG OUT"),
                  onTap:(){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyApp()));
                  }
              ),
            ],)
        )
    ),

  );
}
//BOTTOM NAVIGATION
Widget bottom(context,t,user){
  return BottomNavigationBar(
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor:Colors.black,
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor:Colors.black,
          icon: Icon(Icons.shopping_cart),

          label: 'Orders',
        ),
        BottomNavigationBarItem(
          backgroundColor:Colors.black,
          icon: Icon(Icons.notifications_active_outlined),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          backgroundColor:Colors.black,
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
        ),
      ],

      onTap: (int index) async {
        print(user+t);
        switch (index)  {
          case 0: if(t=="shopkeeper"){ final  products = await  productandorderlist(user,"product_list") ;
            Navigator.push(context, MaterialPageRoute(builder: (_) => dashboard(license:user,products: products,)));}
          else if(t=="customer") {
print("oseal");print(user);
             final  products = await  productandorderlist(user,"shop") ;
            Navigator.push(context, MaterialPageRoute(builder: (_) => dash(user:user,shops: products,)));
          }


          break;
          case 1:
           if(t=="shopkeeper") {
              final order = await productandorderlist(user, "order_list");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => orderlist(user: user, order: order)));
            }
           if(t=="customer") {
             final cart = await productandorderlist(user, "viewcart");
             print(cart);
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (_) => viewcart(user: user, cart: cart)));
           }
            break;
          case 2://notification
            break;
          case 3: final  order = await  profile(user,t)   ;
          Navigator.push( context, MaterialPageRoute(builder: (_) => profilepage(n:order,type:t,user:user)));
            break;
        }} );


}
//AppBar
Widget myAppBar(String title,context) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Center(child: Text(title, style: TextStyle(color: Colors.white),)),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ],
  );
}

Widget _buildreg(user,context) {
  var variable;
  return AlertDialog(
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          onChanged:(value){
            variable=value;
          },
          validator: (value){
            if (value.isEmpty){
              return 'Registration Number required';
            }
            return null;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Registration Number',
              hintText: "Enter shop's registration number",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors
                      .blueGrey[600])
              )
          ),

        ),

      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          // print(variable);
          if (variable != null) {
            Register_to_shop(variable,user,context);
            Navigator.of(context).pop();
          }
        },
        textColor: Colors.black54,
        child: const Text('Register'),
      ),
    ],
  );
}
