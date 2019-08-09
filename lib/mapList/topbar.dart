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
          width: 355,
          height: 45,
          color: Colors.red,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.settings),

              Padding(padding: EdgeInsets.only(left: 40, right: 10),),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(padding: EdgeInsets.only(left: 10, right: 20),),
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
