import 'package:flutter/material.dart';
import 'package:grid_comparison/reorderables/view.dart';
import 'package:grid_comparison/reorderables_provider/view.dart';

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
            _button("reorderables_provider", () => Navigator.of(context).pushNamed("/reorderables_provider")),
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
