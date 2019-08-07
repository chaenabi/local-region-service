import 'package:flutter/material.dart';
import 'package:mtms/screens/add_place_screen.dart';

class TopBar extends StatefulWidget {
  final String title;

  TopBar({this.title});

  @override
  State<StatefulWidget> createState() {
    return _TopBarState();
  }
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Container(
          width: 360,
          height: 45,
          color: Colors.red,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              
              Icon(Icons.settings),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
