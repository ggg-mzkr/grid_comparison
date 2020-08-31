import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grid_comparison/dragablegridview_flutter_provider/vm.dart';
import 'package:provider/provider.dart';

import 'item_bin.dart';

class DragablegridviewFlutterViewProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: Body(),
    );
  }
}

class Body extends StatelessWidget {

  final double iconSize = 90;

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("DragablegridviewFlutter with Provider"),
        actions: <Widget>[
          Center(
              child: GestureDetector(
                child: Container(
                  child: Text(vm.isEditting? '完了': '編集', style: TextStyle(fontSize: 19.0),),
                  margin: EdgeInsets.only(right: 12),
                ),
                onTap: (){
                  Provider.of<ViewModel>(context, listen: false).changeActionState();
                  vm.editSwitchController.editStateChanged();
                },
              )
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 500,
            child: DragAbleGridView(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 4.0,
              itemBins: vm.icons,
              editSwitchController: vm.editSwitchController,
              isOpenDragAble: true,
              animationDuration: 200, //milliseconds
              longPressDuration: 300, //milliseconds
              deleteIcon: CircleAvatar(
                maxRadius: 10,
                backgroundColor: Colors.red,
                child: Icon(Icons.close, size: 20,),
              ),
              child: (int position){
                return Icon(vm.icons[position].data, size: iconSize);
              },
              editChangeListener: Provider.of<ViewModel>(context, listen: false).changeActionState,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              _button(Icons.add_circle, Colors.deepOrange, () {
                Provider.of<ViewModel>(context, listen: false).addTile(Icons.filter_9_plus);
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
