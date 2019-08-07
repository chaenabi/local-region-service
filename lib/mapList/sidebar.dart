import 'package:flutter/material.dart';
import 'package:mtms/mapList/sidebarListTile.dart';
import 'package:mtms/models/list.dart';
import './showlist.dart';

//this is SideBar Widget for just "Printing List"
class SideBar extends StatefulWidget {
  final List<Map<String, Object>> territoryList;
  SideBar(this.territoryList);

  @override
  State<StatefulWidget> createState() {
    return _SideBarState();
  }
}

class _SideBarState extends State<SideBar> {
  int sideBarCurrentSelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0)),
          Icon(Icons.build),
          Padding(padding: EdgeInsets.all(5.0)),
         
          Expanded(
            child: Container(
              child: _territories(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _territories() {
    Widget territory;

    if (widget.territoryList.length > 0) {
      territory = ListView.builder(
        key: _keepPage(),
        itemBuilder: (context, counter) {
          return _buildSideBar(context, counter);
        },
        itemCount: widget.territoryList.length,
      );
    } else {
      territory = Container(child: Container());
    }
    return territory;
  }
  PageStorageKey<String> _keepPage() {
    return PageStorageKey<String>('keep-position');
  }

  Widget _buildSideBar(BuildContext context, int index) {
    return Container(
      //decoration: BoxDecoration(color: Colors.green),
      child: Column(
        children: [
          SideBarListTile(
            title: (territorylist[index]['region'].toString()),
            onTap: () {
              setState(() {
                //리스트 중 아이템 하나만 색깔이 바뀌도록 만드는 for문
                for (int i = 0; i < territorylist.length; i++) {
                  if (i != index) {
                    territorylist[i]['checked'] = false;
                  }
                }
                territorylist[index]['checked'] = true;
              });

              ShowList.topbarTitle
                  .add((territorylist[index]['region'].toString()));
            },
            isSelected: _isSelected(index),
          ),
        ],
      ),
    );
  }

  bool _isSelected(int index) {
    return territorylist[index]['checked'] == true;
  }
}
