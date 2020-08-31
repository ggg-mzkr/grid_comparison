import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grid_comparison/reorderables_provider/vm.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

class ReorderablesProviderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Reorderables with Provider"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: Scaffold(
        body: Tiles(),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    var _iconSize = Provider.of<ViewModel>(context, listen: false).iconSize;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ReorderableWrap(
            spacing: 8.0,
            runSpacing: 4.0,
            padding: const EdgeInsets.all(8),
            children: Provider.of<ViewModel>(context).tiles,
            onReorder: Provider.of<ViewModel>(context, listen: false).onReorder,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              _button(Icons.add_circle, Colors.deepOrange, () {
                Provider.of<ViewModel>(context, listen: false).addTile(Icon(Icons.filter_9_plus, size: _iconSize));
              }),
              _button(Icons.remove_circle, Colors.teal, () {
                Provider.of<ViewModel>(context, listen: false).removeTile();
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