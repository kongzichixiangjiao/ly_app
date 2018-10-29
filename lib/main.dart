// main.dart

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:ly_app/MainPage.dart';

import 'package:ly_app/Model/UserInfo.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ly_app/Redux/YYRedux.dart';

void main() {
  runApp(
//    new Root()
    new Rooter()
  );
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LYAPP',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}


class Rooter extends StatefulWidget {

  Rooter({Key key}) : super(key : key);

  _RooterState createState() => _RooterState();
}

class _RooterState extends State<Rooter> with WidgetsBindingObserver{

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

  final store = new Store<YYState>(appReducer, initialState: new YYState(userInfo: UserInfo.empty()));

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreBuilder<YYState>(builder: (context, store) {
          return new MainPage();
        }
        )
    );
  }
}

/*
    // 访问数据
    StoreProvider.of(context).state.userInfo;
    // 更新数据
    StoreProvider.of(context).dispatch(new UpdateUserInfoAction(newUserInfo));
* */


































