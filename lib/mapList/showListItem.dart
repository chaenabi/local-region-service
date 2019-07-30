import 'package:flutter/material.dart';
import '../model/list.dart';

class ShowListItem extends StatefulWidget {
  final String title;
  ShowListItem({this.title});

  @override
  State<StatefulWidget> createState() {
    return _ShowListItemState();
  }
}

PageStorageKey<String> _keepPage() {
  return PageStorageKey<String>('keep-position');
}

class _ShowListItemState extends State<ShowListItem> {
  _buildList() {
    return Expanded(
      child: Container(
        width: 320,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _buildDoryang(context, index);
          },
          key: _keepPage(),
          itemCount: doryanginfo.length,
        ),
      ),
    );
  }

  Widget _buildDoryang(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Checkbox(
              value: doryanginfo[index]['clicked'],
              onChanged: (bool value) {
                setState(() {
                  doryanginfo[index]['clicked'] = value;
                });
              },
            ),
            Text(doryanginfo[index]['map'].toString()),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/map');

              },
            )
          ],
        ));
  }

  Widget _selectedList(String title) {
    switch (title) {
      case '도량':
        return _buildList();
        break;
      case '봉곡':
        return Text('봉곡');
        break;
      case '부곡':
        return Text('부곡');
        break;
      case '선기':
        return Text('선기');
        break;
      case '원평':
        return Text('원평');
        break;
      case '무을':
        return Text('무을');
        break;
      case '각산':
        return Text('각산');
        break;
      case '수성':
        return Text('수성');
        break;
      case '포항':
        return Text('포항');
        break;
      case '달성':
        return Text('달성');
        break;
      default:
        return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _selectedList(widget.title);
  }
}
