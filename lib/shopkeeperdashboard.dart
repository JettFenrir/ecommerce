import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/demo.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:ecommerce/product1.dart';
import 'package:ecommerce/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
List colors =[Colors.yellow,Colors.blue,Colors.greenAccent];
void main() {
  runApp(dashboard());
}

class dashboard extends StatefulWidget {
  final String license;
  const dashboard(
      {Key key, this.license})
      : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(user:widget.license),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String user;
  const MyHomePage(
      {Key key, this.user})
      : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  post()async{
    var url = Uri.parse('http://192.168.0.129:8080/product_list');
    var response =
    await http.post(url, body: {"user":widget.user});
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => productlist(l:response.body,li:widget.user)),
    );

  }
  orders()async{
    var url = Uri.parse('http://192.168.0.129:8080/order_list');
    var response =
    await http.post(url, body: {"user":widget.user});

    print(response.body);
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => orderlist(l:response.body)),
    );

  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow[50],
      appBar: myAppBar('DASHBOARD',context),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin:EdgeInsets.fromLTRB(5, 5, 5, 40),
                  height: 430,
                  width: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        width: 450,
                        height: 400,
                        color: Colors.white,
                        child:
                        PinchZoom(
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

                          },
                          onZoomEnd: () {

                          },
                        ),

                      ),
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
                        ),),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 450,
                        height: 400,
                        color: Colors.white,
                        /*child: PhotoView(
                  imageProvider: NetworkImage("https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                )*/
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
                        ),),],),),

                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 45,
                    child: ElevatedButton(
                      onPressed: (){
                        final us = widget.user;
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => App(v:us,)));
                      },


                      child: Center(
                        child: Text(
                          'ADD PRODUCT',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ],),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyApp()));
                  },


                  child: Center(
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 45,
                child: ElevatedButton(onPressed:(){
                  post();
                },
                  child: Center(
                    child: Text(
                      'Product List', style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                    ),
                  ),
                )

            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 45,
              child: ElevatedButton(onPressed: (){ orders();},
                child: Center(
                  child: Text(
                    'Order List',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),),



            SizedBox(height: 30),
            //here we can add our code

          ]),
      //bottomNavigationBar: bottom(context,widget.),

    );
  }
}
class productlist extends StatefulWidget {
  final  String l,li;
  const productlist({Key key ,this.l,this.li}) : super(key: key);

  @override
  State<productlist> createState() => _productlistState();
}

class _productlistState extends State<productlist> {
  get names => json.decode(widget.l) as List<dynamic>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text("Product List"),
      ),
      body:ListView.builder(
// scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                int j =index;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => prod(n:widget.l,user:widget.li,i:index)),
                );
              },
              title:  Padding(
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
                            '${names[index]['nameoftheproduct']}',
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
    );
  }
}
class prod extends StatefulWidget {
  final  n,user,i;
  const prod({Key key,this.n,this.user,this.i}) : super(key: key);

  @override
  State<prod> createState() => _prodState();
}

class _prodState extends State<prod> {
  List product;
  var index;
  bool change=true;
  List newlist= [];
  List editlist=[];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    product = json.decode(widget.n) as List ;
    index = widget.i;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text("Product info"),
      ),
      body:  ListView(
        scrollDirection: Axis.vertical,
        children:   [
          (product.length>0) ? ListTile(

            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(key:_formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    Image(
                      image: NetworkImage("http://192.168.0.129:8080/getImage"),
                      fit: BoxFit.fill,
                    ),

                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,

                              initialValue : product[index]["nameoftheproduct"],
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                print("oo");
                                print(value);
                                product[0]["nameoftheproduct"] = value;
                                print(product[0]["nameoftheproduct"]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,

                              initialValue : product[index]["description"],
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                product[0]["description"] = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Specification:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,

                              initialValue : (product[index]["specification"]!=" ") ?product[index]["specification"]:"No specifications",
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                product[0]["specification"] = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cost:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,

                              initialValue : product[index]["cost"],
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                product[0]["cost"] = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery cost:",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width:10),
                        Container(
                          child: new Flexible(
                            child: TextFormField(
                              readOnly: change,

                              initialValue :   (product[index]["delivarycost"]!=" ") ?product[index]["delivarycost"]:"Free",
                              // style:  TextStyle(fontSize: 10,fontWeight:FontWeight.bold),

                              validator: (String value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                                return null;

                              },
                              onSaved: (String value) {
                                product[0]["delivarycost"] = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: (change == true)?Text(
                            'EDIT',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ):Text(
                            'SAVE',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),

                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            if(change==false){
                              _formKey.currentState.save();
                              print(product);
                              editlist.add(product[index]);
                              print(editlist[0]);
                              edit(editlist);
                            }
                            setState(() => {change = !change});

                          },
                        ),
                        SizedBox(width:20.0),
                        ElevatedButton(
                          child: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            newlist.add(product[index]);

                            setState(() => product.removeAt(index));
                            delete(newlist);

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ): Center(child: Text("The product has been deleted" , style:TextStyle(color: Colors.red,))),
        ],
      ),
    );
  }
  delete(new_list)async{
    var url = Uri.parse('http://192.168.0.129:8080/deletefromproduct');
    var response =
    await http.post(url, body:{
      'new_list': jsonEncode(new_list),
      'user':widget.user
    }
    );
    print(response.body);


  }
  edit(new_list)async{
    var url = Uri.parse('http://192.168.0.129:8080/editfromproduct');
    var response =
    await http.post(url, body:{
      'new_list': jsonEncode(new_list),
      'user':widget.user
    }
    );
    print(response.body);


  }

}
class orderlist extends StatefulWidget {
  final String l;
  const orderlist({Key key,this.l}) : super(key: key);

  @override
  State<orderlist> createState() => _orderlistState();
}

class _orderlistState extends State<orderlist> {
  get order => jsonDecode(widget.l) as List;
  List<TableRow> rows = [ TableRow(
    children: [Text("Product Name", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      Text('Quantity', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
      Text("customer's informaion", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
      // Text('Status', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
    ],
  ),];
  int i;
  @override
  void initState() {
    print(order.length);
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
    );
  }
}