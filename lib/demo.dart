
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/addtocart.dart';
import 'package:ecommerce/cust_dash.dart';
import 'package:ecommerce/rithal.dart';

List Names =[];
Widget myAppBar(String title,context) {

  return AppBar(

    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black54),
    //background color of Appbar to green
    title: Center(child: Text(title,
    style: TextStyle(color: Colors.black87),
    )),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search,
        color: Colors.black54,
        ),
        onPressed: () {
          showSearch(context: context, delegate: Search());
        },
      ),


    ],
  );
}
Widget card(names){
  ListView.builder(
    // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {

            //post(names[index]);
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
Widget bottom(BuildContext context,user){
  // int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  return Material(
      elevation: 7.0,
      color: Colors.white,
      child: Container(
      height: 50.0,
      //width: MediaQuery.of(context).size.width,
  color: Colors.white,
  child: Padding(
  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => custdashboard(p:"1223")),
    );
  },
  child: Container(
  height: 50.0,
  width: 50.0,
  color: Colors.white,
  child: Icon(
  Icons.home_filled,
  color: Colors.grey,
  ),
  ),
  ),

  InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(user: '1223',)),
    );
  },
  child: Container(
  height: 50.0,
  width: 50.0,
  color: Colors.white,
  child: Icon(
  Icons.shopping_cart_rounded,
  color: Colors.grey
    ,
  ),
  ),
  ),
    InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyHomePage(user: '1223',)),
        // );
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        color: Colors.white,
        child: Icon(
          Icons.notifications_sharp,
          color: Colors.grey,
        ),
      ),
    ),
  InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => profile(user: user,)),
    );

  },
  child: Container(
  height: 50.0,
  width: 50.0,
  color: Colors.white,
  child: Icon(
  Icons.account_box,
  color: Colors.grey,
  ),
  ),
  ),
  ]),
  )));
}
Widget myDrawer(context,p){
  return Drawer(
    child: SingleChildScrollView(

        child:Container(
           // color: Colors.black54,
            margin:EdgeInsets.only(top:50),
          //  color: Colors.black54,
            child:Column(children: <Widget>[

              ListTile(
                  leading:Icon(Icons.home , color: Colors.black54),

                  title:Text("Home"),
                  onTap:(){

                  }
              ),

              ListTile(
                  leading:Icon(Icons.person),
                  title:Text("Past orders"),
                  onTap:(){
                    // My Pfofile button action
                  }
              ),

              ListTile(
                  leading:Icon(Icons.search),
                  title:Text("Register more shops"),
                  onTap:(){

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildreg(p,context);
                      },
                    );
                  }
              )


            ],)
        )
    ),

  );
}
Widget _buildreg(p,context) {
  var variable;
  print(variable);
  print("rithal");
  return AlertDialog(
    // title: const Text('Popup example'),

    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(

          keyboardType: TextInputType.visiblePassword,
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
            postTest(variable, p, context);
            Navigator.of(context).pop();

          }

        },
        textColor: Colors.black54,
        child: const Text('Register'),
      ),
    ],
  );
}
postTest(variable,p,context) async {

  var url = Uri.parse('http://192.168.0.129:8080/reg');
  var response =
  await http.post(url, body: {"regno":variable, "user":p});
  print(response.body);
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
class search {
//shop name
//catagory
// product name
  final String shopname;
  final String Catagory;
  final String productname;
  //final int id;

 search({this.shopname, this.Catagory, this.productname});
  //, this.id

  //Factory Method lets a class defer instantiation to subclasses.
  factory search.fromJson(Map<String, dynamic> json) {
    return search(
      shopname :json['shopname'],
      Catagory : json['catagory'],
      productname: json['nameoftheproduct'],
      //id: json['id'],
    );
  }
}




class Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }


  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<List<search>>(
      future: _fetchsearchkey(searchkey: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<search> data = snapshot.data;
          print(data);
          return _medicinesListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());

      },
    );
  }

  Future<List<search>> _fetchsearchkey({@required String searchkey}) async {
    var url = Uri.parse('http://192.168.0.129:8080/search');
    var response =
    await http.post(url, body: {"search":searchkey});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((searchkey) => new search.fromJson(searchkey))
          .toList();
    } else {
      throw Exception('Failed to load $searchkey from API');
    }
  }

  ListView _medicinesListView(data) {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].shopname,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            data[index].Catagory,
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            data[index].nameoftheproduct,
                            style: TextStyle(fontSize: 15),
                          ),

                          //changes

                          SizedBox(height: 15),

                          //till here
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? Names : Names.where((p) {
      final pLower = p.toLowerCase();
      final queryLower = query.toLowerCase();
      return pLower.startsWith(queryLower);
    }).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
        // leading: Icon(Icons.location_city),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ])),
      ),
      itemCount: suggestionList.length,
    );
  }

}



