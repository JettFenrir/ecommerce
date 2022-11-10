import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../customer/dashboard.dart';
import '../shopkeeper/dashboard.dart';
productandorderlist(user,title)async{
  List products=[];
  var url = Uri.parse('http://192.168.0.129:8080/$title');
  var response = await http.post(url, body: {"user":user});
 return(response.body);
}
editordeleteproduct(name,cost,spec,delc,desc,user,title)async{
  var url = Uri.parse('http://192.168.0.129:8080/$title');
  var response =
  await http.post(url, body:{
    "nameoftheproduct":name,"description":desc,"specification":spec,"cost":cost,"delivarycost":delc,
    'user':user
  }
  );
}
add_product(nameoftheproduct,catagory,searchkey,description,cost,specification,delivarycost,license)
async {
  String info;
  var url = Uri.parse('http://192.168.0.129:8080/product');

  var response = await http.post(url, body: {"nameoftheproduct":nameoftheproduct,"catagory":catagory,"searchkey":searchkey,"description":description,"cost":cost,"specification":specification,"delivarycost":delivarycost,"license":license});

}
profile(user,t) async {
  String info;
  var url = Uri.parse('http://192.168.0.129:8080/profile');
 if(t=="customer") {
    var response = await http.post(url, body: {"phone": user, "type": t});
    return(response.body);
  } else if(t=="shopkeeper") {
    var response = await http.post(url, body: {"shoplicence": user, "type": t});
    return(response.body);
  }
}
//catagory
product_catagory(user) async {
  var url = Uri.parse('http://192.168.0.129:8080/catagory');
  var response = await http.post(url,body: { "shoplicence":user});
  return(response.body);
}
//products_of_same_catagory
products(catagory,shop) async {
  var url = Uri.parse('http://192.168.0.129:8080/productsofsamecatagory');
  var response = await http.post(url, body: {"cat": catagory,"shoplicence":shop});
 print(response.body);
 return(response.body);
}
//cart
cart(name,cost,user,shop,num,delc)async
{
  print("welco");
  final number = num.toString();
var url = Uri.parse('http://192.168.0.129:8080/cart');
var response =  await http.post(url, body: {"name":name,"cost":cost,"delc":delc,"user":user,"shoplicence":shop,"quantity":number});
}
//delete or place order
deleteorplaceorder(new_list,title,user)async{
  var url = Uri.parse('http://192.168.0.129:8080/$title');
  var response = await http.post(url, body:{
    'new_list': jsonEncode(new_list),
    'user':user
  }
  );
}
//register shop
Register_to_shop(shop,user,context) async {
  var url = Uri.parse('http://192.168.0.129:8080/register_to_shop');
  var response = await http.post(url, body: {"regno":shop, "user":user});
  String text;
  text= response.body;
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          title: Text("$text"),
        );
      });

}
//customer registration
customerregistration(name,phone,email,address,password) async {
  var url = Uri.parse('http://192.168.0.129:8080/reg');
  var response = await http.post(url, body: {
    "name":name,"phone":phone,
    "email":email,"address":address ,
    "password": password,"type":"customer"});
  var respStr = response.body;
  return jsonDecode(respStr);
}
//shopkeeper registration
posttest(shopname,shoplicence,shoptype,name,phone,email,username,password) async {
  var url = Uri.parse('http://192.168.0.129:8080/appData');
  var response = await http.post(url, body: {"shopname":shopname,"shoplicence":shoplicence,"shoptype":shoptype,
    "name":name,"phone":phone,
    "email":email,"username":username ,
    "password": password,"type":"shopkeeper"});
  var respStr = response.body;
  return jsonDecode(respStr);
}
//login
log_in(email,password,context) async {
  var type;
  var url = Uri.parse('http://'
      '192.168.0.129:8080/login');
  var response =
  await http.post(url, body: {"email": email, "password": password});
  if (response.statusCode == 200) {
    Map<String, dynamic> data = new Map<String, dynamic>.from(
        json.decode(response.body));
    type = data['id'];
    var l = data['license'];
    var p = data['p'];
    if(type == "shopkeeper")
    { final  products = await  productandorderlist(l,"product_list") ;
    Navigator.push(context, MaterialPageRoute(builder: (_) => dashboard(license:l,products: products,)));
    }
    else if ( type == "customer")
    {
      final  shops = await  productandorderlist( p ,"shop") ;
      Navigator.push(context, MaterialPageRoute(builder: (_) => dash(user:p,shops:shops)));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('invalid email or password')));
    }


  }
  return (type);
}

