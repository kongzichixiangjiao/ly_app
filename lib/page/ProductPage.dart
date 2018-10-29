import 'package:flutter/material.dart';
import 'package:ly_app/Routes.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ly_app/Redux/UserInfoRedux.dart';
import 'package:ly_app/Model/UserInfo.dart';
import 'package:ly_app/Redux/YYRedux.dart';
import 'package:redux/redux.dart';

class ProductPage extends StatefulWidget {
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Store<YYState> _getStore() {
    if (context == null) {
      print("YYState null");
      return null;
    }
    return StoreProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Product"),
      ),
      body: new Center(
        child: new Card(
          elevation: 4.0,
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(2.0),
            )
          ),
          child: new IconButton(icon: Icon(Icons.add), onPressed: () {

            var map={"name":"更爱","id":2};
            UserInfo newUserInfo = UserInfo.fromJson(map);

            _getStore()?.dispatch(new UpdateUserInfoAction(newUserInfo));

            Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
              return new Routes();
            },
            )
            );
          }),
        ),
      ),
    );
  }
}