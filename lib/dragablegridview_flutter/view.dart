import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_bin.dart';

class DragablegridviewFlutterView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DragablegridviewFlutterViewState();
  }
}

class DragablegridviewFlutterViewState extends State<DragablegridviewFlutterView>{

  final double iconSize = 90;

  List<ItemBin> icons = List<ItemBin>();

  bool isEditting = false;

  var editSwitchController = EditSwitchController();

  @override
  void initState() {
    super.initState();
    icons = <ItemBin>[
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DragablegridviewFlutter"),
        actions: <Widget>[
          Center(
              child: GestureDetector(
                child: Container(
                  child: Text(isEditting? '完了': '編集', style: TextStyle(fontSize: 19.0),),
                  margin: EdgeInsets.only(right: 12),
                ),
                onTap: (){
                  changeActionState();
                  editSwitchController.editStateChanged();
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
              itemBins: icons,
              editSwitchController:editSwitchController,
              isOpenDragAble: true,
              animationDuration: 200, //milliseconds
              longPressDuration: 300, //milliseconds
              deleteIcon: CircleAvatar(
                maxRadius: 10,
                backgroundColor: Colors.red,
                child: Icon(Icons.close, size: 20,),
              ),
              child: (int position){
                return Icon(icons[position].data, size: iconSize);
              },
              editChangeListener: (){
                changeActionState();
              },
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              _button(Icons.add_circle, Colors.deepOrange, () {
                setState(() {
                  icons.add(ItemBin(Icons.filter_9_plus));
                });
              }),
              _button(Icons.remove_circle, Colors.teal, () {
                setState(() {
                  icons.removeAt(0);
                });
              })
            ],
          ),
        ],
      ),
    );
  }

  void changeActionState(){
    setState(() {
      isEditting = !isEditting;
    });
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