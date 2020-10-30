import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigationdrawer_app/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.teal[100]
              : null),
      home: HomePage(),
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => NewPage(
      //         title: "New Page",
      //       ),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Aditya Singh"),
              accountEmail: Text('adisingh675@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.purple
                        : Colors.teal,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.deepPurpleAccent
                          : Colors.grey,
                  child: Text(
                    "N",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text("Page 1"),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> NewPage(title: "Page 1")));
              },
            ),
            ListTile(
              title: Text("Page 2"),
              trailing: Icon(Icons.analytics_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> NewPage(title: "Page 2",)));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
