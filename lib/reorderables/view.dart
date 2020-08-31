import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class ReorderablesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Reorderables"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {

  @override
  State createState() {
    return BodyState();
  }
}


class BodyState extends State<Body> {
  final double _iconSize = 90;
  List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = <Widget>[
      Icon(Icons.filter_1, size: _iconSize),
      Icon(Icons.filter_2, size: _iconSize),
      Icon(Icons.filter_3, size: _iconSize),
      Icon(Icons.filter_4, size: _iconSize),
      Icon(Icons.filter_5, size: _iconSize),
      Icon(Icons.filter_6, size: _iconSize),
      Icon(Icons.filter_7, size: _iconSize),
      Icon(Icons.filter_8, size: _iconSize),
      Icon(Icons.filter_9, size: _iconSize),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ReorderableWrap(
            spacing: 8.0,
            runSpacing: 4.0,
            padding: const EdgeInsets.all(8),
            children: _tiles,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                Widget row = _tiles.removeAt(oldIndex);
                _tiles.insert(newIndex, row);
              });
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              _button(Icons.add_circle, Colors.deepOrange, () {
                setState(() {
                  _tiles.add(Icon(Icons.filter_9_plus, size: _iconSize));
                });
              }),
              _button(Icons.remove_circle, Colors.teal, () {
                setState(() {
                  _tiles.removeAt(0);
                });
              })
            ],
          ),
        ],
      ),
    );
  }

  Widget _button(IconData icon, MaterialColor color, VoidCallback callback) {
    return IconButton(
      iconSize: 50,
      icon: Icon(icon),
      color: color,
      padding: const EdgeInsets.all(0.0),
      onPressed: callback,
    );
  }
}