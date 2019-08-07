import 'package:flutter/material.dart';
import './mapList/sidebar.dart';
import './models/list.dart';
import 'mapList/showlist.dart';

class MapPage extends StatefulWidget {
  State<MapPage> createState() {
    return _MapPageState();
  }
}

@override
bool get wantKeepAlive => true;

class _MapPageState extends State<MapPage> {
  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('mapList'),
      backgroundColor: Colors.red,
    );
  }

  Widget _buildBody() {
    return Container(
      //color: Colors.blue,
      child: Row(
        children: <Widget>[
          Expanded(
            child: SideBar(territorylist),
          ),
          ShowList(),
          //   Container(
          //       width: 350.0,
          //       child: Image.network(
          //           'https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-9/11203249_399567670227980_8018633873156838169_n.png?_nc_cat=104&_nc_oc=AQmQtBN12xY-QYwbZ23HilhynOM2bdFnpHH35tNGPLVPqxQ1X284jQu5i3tC9PjXpIU&_nc_ht=scontent-icn1-1.xx&oh=88da3ae9cccbedb81a571ceaf6e1d5fc&oe=5DE41A73')),
          //
        ],
      ),
    );
  }
}
