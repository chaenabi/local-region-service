import 'package:flutter/material.dart';
import 'package:mtms/mapList/showListItem.dart';
import 'package:mtms/model/list.dart';
import 'package:rxdart/rxdart.dart';

import './topbar.dart';

class ShowList extends StatelessWidget {
  static final topbarTitle = BehaviorSubject<String>();

  void dispose() {
    topbarTitle.close();
  }

  Widget _stream() {
    return Container(
      child: StreamBuilder(
          stream: topbarTitle.stream,
          initialData: '',
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('snapshot has Error : ');
              print(snapshot.error);
            } else {
              if (snapshot.hasData) {
                return TopBar(title: '${snapshot.data}');
              }
            }
            return TopBar(title: 'title');
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _stream(),
    ]);
  }
}
