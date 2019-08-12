import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';
import './loginmenu/tab_page.dart';
import './data/signin_or_signup.dart';
import './loginmenu/login.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Territory Card',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.blue,
          accentColor: Colors.black,
        ),
        home: Startup(),
        routes: {
          '/enter': (BuildContext context) => TabPage(),
          '/map': (BuildContext context) => PlacesListScreen(),
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //_startup4dev(context);
        _startupWithAuth();
  }
}

Widget _startup4dev(BuildContext context) {
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

Widget _startupWithAuth() {
  return Scaffold(
    body: ChangeNotifierProvider<SignInOrSignUp>.value(
      value: SignInOrSignUp(),
      child: LoginPage(),
    ),
  );
}
