import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_bin.dart';

class ViewModel with ChangeNotifier {

  List<ItemBin> icons = <ItemBin>[
    ItemBin(Icons.filter_1),
    ItemBin(Icons.filter_2),
    ItemBin(Icons.filter_3),
    ItemBin(Icons.filter_4),
    ItemBin(Icons.filter_5),
    ItemBin(Icons.filter_6),
    ItemBin(Icons.filter_7),
    ItemBin(Icons.filter_8),
    ItemBin(Icons.filter_9),
  ];

  bool isEditting = false;

  var editSwitchController = EditSwitchController();

  void addTile(IconData icon) {
    icons.add(ItemBin(icon));
    notifyListeners();
  }

  void removeTile() {
    icons.removeAt(0);
    notifyListeners();
  }

  void changeActionState() {
    isEditting = !isEditting;
    notifyListeners();
  }
}