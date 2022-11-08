import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


List Names = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Search',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x00000000),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "Search here",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),


        actions: <Widget>[
          //changes
          IconButton(
              icon: Stack(
                children: [
                  Align(
                    child: Icon(Icons.shopping_cart),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 10,
                        /*child: BlocBuilder<MedicineBloc, BlocState>(
                                      builder: (context, state)=>Text('${BlocProvider.of<MedicineBloc>(context).cartProducts.length}', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))
                                  ),*/
                        backgroundColor: Colors.red,
                      )
                  )
                ],
              ),
              //onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart())),
              onPressed: (){}
          ),
          //till here


          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })

        ],
      ),
      drawer: Drawer(),
      body: Container(
        height: 200,
      ),
    );
  }
}


class Medicine {

  final String Name;
  final String Composition;
  final String Usage;
  //final int id;

  Medicine({this.Name, this.Composition, this.Usage});
  //, this.id

  //Factory Method lets a class defer instantiation to subclasses.
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      Name: json['Name'],
      Composition: json['Composition'],
      Usage: json['Usage'],
      //id: json['id'],
    );
  }
}




class DataSearch extends SearchDelegate<String> {
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
    return FutureBuilder<List<Medicine>>(
      future: _fetchMedicines(med: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Medicine> data = snapshot.data;
          return _medicinesListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Medicine>> _fetchMedicines({@required String med}) async {
    final response =
        await http.get(Uri.parse('http://172.20.10.14:8080/search/$med'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((medicines) => new Medicine.fromJson(medicines))
          .toList();
    } else {
      throw Exception('Failed to load medicines from API');
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
                            data[index].Name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            data[index].Composition,
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            data[index].Usage,
                            style: TextStyle(fontSize: 15),
                          ),

                          //changes
                          IconButton(
                              icon: Icon(Icons.shopping_cart),
                              //onPressed: ()=>BlocProvider.of<ProductBloc>(context).add(AddToCart(product: snap.data[index]))
                              onPressed: (){}
                          ),
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
        ? Names
        : Names.where((p) {
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
