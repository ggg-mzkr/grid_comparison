import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewModel with ChangeNotifier {

  final double iconSize = 90;

  List<Widget> _tiles = List<Widget>();

  List<Widget> get tiles => _tiles;

  ViewModel() {
    _tiles = <Widget>[
      Icon(Icons.filter_1, size: iconSize),
      Icon(Icons.filter_2, size: iconSize),
      Icon(Icons.filter_3, size: iconSize),
      Icon(Icons.filter_4, size: iconSize),
      Icon(Icons.filter_5, size: iconSize),
      Icon(Icons.filter_6, size: iconSize),
      Icon(Icons.filter_7, size: iconSize),
      Icon(Icons.filter_8, size: iconSize),
      Icon(Icons.filter_9, size: iconSize),
    ];
  }

  void addTile(Widget tile) {
    _tiles.add(tile);
    notifyListeners();
  }

  void removeTile() {
    _tiles.removeAt(0);
    notifyListeners();
  }

  void onReorder(int oldIndex, int newIndex) {
    Widget tile = _tiles.removeAt(oldIndex);
    _tiles.insert(newIndex, tile);
    notifyListeners();
  }
}