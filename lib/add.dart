import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:ecommerce/addtocart.dart';
import 'package:ecommerce/demo.dart';
import 'package:ecommerce/cust_dash.dart';
import 'package:quantity_input/quantity_input.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(add());
}

// var a  ;
// var b ;
// var c ;
class add extends StatefulWidget {
  final String p,shop;
  const add(
      {Key key, this.p,this.shop})
      : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ad(user:widget.p,shop:widget.shop),

    );
  }
}
class ad extends StatefulWidget {
  final String user,shop;
  const ad(
      {Key key, this.user,this.shop})
      : super(key: key);

  @override
  _adState createState() => _adState();
}

class _adState extends State<ad> {
  postTest() async {

    String info;

    var url = Uri.parse('http://192.168.0.129:8080/ad');
    var response = await http.post(url,body: { "shoplicence":widget.shop});
    var respStr = "";
    if (response.statusCode == 200) {


      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => advertise(n:response.body,user:widget.user,shop:widget.shop)),
      );

    } else {
      info = "Error in response";
    }
  }
  @override
  Widget build(BuildContext context) {
    postTest();
    return Container(

    );
  }
}

class advertise extends StatefulWidget {
  final String n,user,shop;
  const advertise(
      {Key key,  this.n,this.user,this.shop})
      : super(key: key);
  @override
  _advertiseState createState() => _advertiseState();
}

class _advertiseState extends State<advertise> {

  int counter=0;

  post(cat) async {

    List<List> names = <List>[];

    var url = Uri.parse('http://192.168.0.129:8080/ad2');
    var response = await http.post(url, body: {"cat": cat,"shoplicence":widget.shop});
    // print(response.body);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body) as List;
      var data = responseJson.length;


      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => add3(n:response.body,user:widget.user,shop:widget.shop)),
      );

    } else {
      String info = "Error in response";
    }
  }
  Widget _buildquoteTemplate() {
    final  names = json.decode(widget.n) as List;

    return
      ListView.builder(
        // scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {

                post(names[index]);
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
      //backgroundColor:  Colors.white12,
      appBar: myAppBar('PRODUCT CATAGORY',context),


      body: Column(
        children: [
          SizedBox(height: 5.0),
          _buildquoteTemplate(),
          //SizedBox(height: 20.0),
        ],
      ),
      bottomNavigationBar: bottom(context,widget.user),
    );
  }
}
//next slide

class add3 extends StatefulWidget {
  final String n,user,shop;

  const add3({Key key, this.n ,this.user,this.shop}) : super(key: key);

  @override
  _add3State createState() => _add3State();
}

class _add3State extends State<add3> {


  @override
  Widget _buildquoteTemplate() {
    final names = json.decode(widget.n) as List;
    // print(names);

    //final List<String> names = <String>[widget.n];
    return
      ListView.builder(
// scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => add4(n:widget.n , i:index,user:widget.user,shop:widget.shop)),
                );
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
      appBar: myAppBar('PRODUCT INFORMATION',context),
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
      bottomNavigationBar: bottom(context,widget.user),
    );
  }
}
class add4 extends StatefulWidget {
  final n,i,user,shop;
  const add4({Key key,this.n,this.i,this.user,this.shop}) : super(key: key);

  @override
  _add4State createState() => _add4State();
}

class _add4State extends State<add4> {
  var number=1;
  @override

  Widget _buildquoteTemplate() {
    final product = json.decode(widget.n) as List;

    var index = widget.i;

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
              "NAME:${product[index]["nameoftheproduct"]}",
              style: TextStyle(
                fontSize: 20.0,

                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "DESCRIPTION :${product[index]["description"]}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "SPECIFICATION:${product[index]["specification"]}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "COST:${product[index]["cost"]}",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              "DELIVERY COST:${product[index]["delivarycost"]}",
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

                  setState(() {
                    final l = [product[index]["nameoftheproduct"] , product[index]["catagory"] , product[index]["cost"] ,product[index]["description"] ];
                    list.add(l);



                  });
                  post(number);


                },
                  child:Text("add to cart",
                    style: TextStyle(color: Colors.blue, fontSize: 30), ),
                ),
                SizedBox(width: 35.0),
                RaisedButton(onPressed: (){},
                  child:Text("buy now", style: TextStyle(color: Colors.blue, fontSize: 30),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  static final list = [] ;
  Future<String> post(number)async
  {final names = json.decode(widget.n) as List;

  String user = widget.user;
  String num =number.toString();

  var url = Uri.parse('http://192.168.0.129:8080/cart');
  print(widget.shop);
  print(widget.user);
  var response =
  await http.post(url, body: {"name":names[0]['nameoftheproduct'],"cost":names[0]['cost'],"user":user,"shoplicence":widget.shop,"quantity":num});
  print(response.body);
  final data = json.decode(response.body) as List;
    //print(data[1]['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('info',
            style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.teal[700],
        actions: <Widget>[

          new Padding(padding: const EdgeInsets.all(10.0),

            child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () { },

                  child: new Stack(

                    children: <Widget>[
                      new IconButton(icon: new Icon(Icons.shopping_cart,
                        color: Colors.black,),
                        onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage(user:widget.user)),
                          );
                        },
                      ),
                      list.length ==0 ? new Container() :
                      new Positioned(

                          child: new Stack(
                            children: <Widget>[
                              new Icon(
                                  Icons.brightness_1,
                                  size: 20.0, color: Colors.green[800]),
                              new Positioned(
                                  top: 3.0,
                                  right: 4.0,
                                  child: new Center(
                                    child: new Text(
                                      list.length.toString(),
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )),


                            ],
                          )),

                    ],
                  ),
                )
            )

            ,)],
      ),
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

    );
  }
}