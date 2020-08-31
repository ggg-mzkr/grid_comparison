import 'package:flutter/material.dart';
import 'package:grid_comparison/dragablegridview_flutter/view.dart';
import 'package:grid_comparison/reorderables/view.dart';
import 'package:grid_comparison/reorderables_provider/view.dart';

import 'dragablegridview_flutter_provider/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIRD VIEW',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: <String, WidgetBuilder> {
        '/reorderables': (BuildContext context) => ReorderablesView(),
        '/reorderables_provider': (BuildContext context) => ReorderablesProviderView(),
        '/dragablegridview_flutter': (BuildContext context) => DragablegridviewFlutterView(),
        '/dragablegridview_flutter_provider': (BuildContext context) => DragablegridviewFlutterViewProvider(),
      },
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("GIRD VIEW"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button("reorderables", () => Navigator.of(context).pushNamed("/reorderables")),
            _button("reorderables with provider", () => Navigator.of(context).pushNamed("/reorderables_provider")),
            _button("dragablegridview_flutter", () => Navigator.of(context).pushNamed("/dragablegridview_flutter")),
            _button("dragablegridview_flutter with provider", () => Navigator.of(context).pushNamed("/dragablegridview_flutter_provider")),
          ],
        ),
      ),
    );
  }

  Widget _button(String text, callback) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        child: Text(text),
        onPressed: callback,
      ),
    );
  }
}
