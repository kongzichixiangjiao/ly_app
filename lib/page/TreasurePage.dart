import 'package:flutter/material.dart';

class TreasurePage extends StatefulWidget {
  TreasurePageState createState() => TreasurePageState();
}

class TreasurePageState extends State<TreasurePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new IconButton(icon: Icon(Icons.add), onPressed: () {

        }),
      ),
    );
  }
}