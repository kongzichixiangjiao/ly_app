import 'package:flutter/material.dart';

class ObserverPage extends StatefulWidget {

  _ObserverPageState createState() => _ObserverPageState();
}

class _ObserverPageState extends State<ObserverPage> with WidgetsBindingObserver{

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("-----------$state------------");

    // 退到后台
    // AppLifecycleState.inactive
    // AppLifecycleState.paused

    // 退到前台
    // AppLifecycleState.inactive
    // AppLifecycleState.resumed
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ObserverPage"),
      ),
      body: new Center(
        child: Text("ObserverPage"),
      ),
    );
  }
}