import 'package:flutter/material.dart';

import './tab_page.dart';
import 'mapCard/detailMap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Startup(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      routes: <String, WidgetBuilder>{
        '/enter': (BuildContext context) => TabPage(),
        '/map' : (BuildContext context) => DetailMap(), 
        //'/landingpage': (BuildContext context) => MyApp(),
        //'/login': (BuildContext context) => LoginPage(),
        //'/signup': (BuildContext context) => SignupPage(),
        //'/validator': (BuildContext context) => RootPage(),
        //'/dr_2d': (BuildContext context) => Dr_2dPage(),
        //'/homepage' : (BuildContext context) => HomePage(),
      },
    );
  }
}

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: FlatButton(
          child: Text('enter'),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/enter'),
        ),
      ),
    );
  }
}
