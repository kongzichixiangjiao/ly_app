import 'package:flutter/material.dart';

class KeyboardFocusPage extends StatefulWidget {

  _KeyboardFocusPageState createState() => _KeyboardFocusPageState();
}

class _KeyboardFocusPageState extends State<KeyboardFocusPage> {
  @override
  Widget build(BuildContext context) {
    ///定义触摸层
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("KeyboardFocusPage"),
      ),
      body: new GestureDetector(
        ///透明也响应处理
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("---");
          ///触摸手气键盘
          FocusScope.of(context).requestFocus(new FocusNode());
          print("---");
        },
        child: new Container(
          child: new TextField(),
        ),
      )
    );
  }
}