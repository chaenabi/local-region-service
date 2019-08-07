import 'package:flutter/material.dart';
import '../models/style.dart';

class SideBarListTile extends StatefulWidget {
  final Function onTap;
  final String title;
  final bool isSelected;
  SideBarListTile(
    {
    @required this.onTap,
    @required this.title,
    this.isSelected = false,
  });

  @override
  _SideBarListTileState createState() => _SideBarListTileState();
}

class _SideBarListTileState extends State<SideBarListTile> {
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          border: BorderDirectional(
              start: BorderSide(
                  color: widget.isSelected ? Colors.blue : Colors.transparent)),
          color: widget.isSelected ? sidbeBarBoxSelectedColor : Colors.transparent,
        ),
        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: widget.isSelected
                  ? sidbeBarSelectedColor
                  : sideBarDefaultColor
            ),
          ],
        ),
      ),
    );
  }
}
