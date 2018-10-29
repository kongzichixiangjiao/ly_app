import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ly_app/Redux/YYRedux.dart';

import 'package:ly_app/Model/UserInfo.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ly_app/Redux/YYRedux.dart';
import 'package:ly_app/Redux/UserInfoRedux.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => new _RoutesState();
}

class _RoutesState extends State<Routes> with WidgetsBindingObserver {

//  Store<YYState> _getStore() {
//    if (context == null) {
//      print("YYState null");
//      return null;
//    }
//    return StoreProvider.of(context);
//  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("123");
    ///通过state判断App前后台切换
    if (state == AppLifecycleState.resumed) {
      print("------$state-----");
    }
    print("------$state-----");

//    var map={"name":"更爱11","id":2};
//    UserInfo newUserInfo = UserInfo.fromJson(map);
//
//    _getStore()?.dispatch(new UpdateUserInfoAction(newUserInfo));

  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context1) => new AlertDialog(
          content: new Text("是否返回"),
          actions: <Widget>[
            new FlatButton(onPressed: () {
              print("取消");
              Navigator.of(context).pop(false);
            }, child:  new Text("取消")),
            new FlatButton(
                onPressed: () {
                  print("返回");
//                  Navigator.pop(context);
                  Navigator.of(context).pop(true);
                },

                child: new Text("确定"))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new StoreBuilder<YYState>(builder: (context, store) {
          return Scaffold(
            appBar: new AppBar(title: new Text("Routes")),
            body: new Container(
              child: new SingleChildScrollView(
                  child: new Center(
                    child: new Text(store.state.userInfo.name),
                  )
              ),
            ),
          );
        }),
        onWillPop: () {
          return _dialogExitApp(context);
        });

  }

}