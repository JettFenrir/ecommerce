 import 'package:flutter/material.dart';

void main()
{
runApp(MyApp());
}

class MyApp extends StatelessWidget{
@override
Widget build(BuildContext context){
return MaterialApp(
title: 'Flutter Demo',
theme: ThemeData(
primarySwatch: Colors.blue,
visualDensity: VisualDensity.adaptivePlatformDensity,
) ,
home: MyHomePage(title: 'DataTable'),
);

}
}

class MyHomePage extends StatefulWidget {
MyHomePage({Key, key, this.title}) : super(key: key);
final String title;

@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage > {

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(widget.title),
),



body: SingleChildScrollView(
child: Container(
height: MediaQuery
    .of(context)
    .size
    .height - 60.0,
child: ListView(
scrollDirection: Axis.horizontal,
children: <Widget>[
Padding(
padding: const EdgeInsets.all(1.0),
child: Container(
width: MediaQuery
    .of(context)
    .size
    .width ,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12.0),
color: Color(0xff5a348b),
gradient: LinearGradient(
colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
begin: Alignment.centerRight,
end: Alignment(-1.0, -1.0)
), //Gradient
),
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.end,

children: <Widget>[
Container(



child: Table(
border: TableBorder(verticalInside: BorderSide(width: 3, color: Colors.teal, style: BorderStyle.solid)),


children: [
TableRow(
decoration: BoxDecoration(color: Colors.teal),
children: [

Text('Name', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('Contact', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
Text('E-Mail', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
Text('Address', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),




]),
TableRow(children: [

RichText(
text: TextSpan(
children: [

WidgetSpan(
child: Icon(Icons.shop_two, size: 15),
),
TextSpan(
text: "",
),
],
),
),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),
TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),
TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),
  TableRow(children: [

Text(' -', textAlign: TextAlign.center,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
Text('-', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),


]),
],
),
),
])),
),
),
]),
),
),
);
}
}