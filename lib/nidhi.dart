import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool swap;
  Color color1,color2;
  final Random random = Random();
  @override
  void initState() {
    swap = false;
    color1 = Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256)
    );
    color2=Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget swapWidget;
    if (swap) {
      swapWidget = Row(
        children: [
          new Container(
            width: 200,
            height: 200,
            color: color2,
          ),
          new Container(
            width: 200,
            height: 200,
            color: color1,
          ),
        ],
      );
    } else {
      swapWidget = Row(
        children: [
          new Container(
            width: 200,
            height: 200,
            color: color1,
          ),
          new Container(
            width: 200,
            height: 200,
            color: color2,
          ),
        ],
      );
    }
    var swapTile = swapWidget;
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  swapTile,
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sync_alt_rounded),
          onPressed: () {
            setState(() {
              swap = !swap;
            });
          }
      ),
    );
  }
}
//tiyhr