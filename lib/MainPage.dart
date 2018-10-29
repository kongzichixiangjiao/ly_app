import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:ly_app/page/HomePage.dart';
import 'package:ly_app/page/MinePage.dart';
import 'package:ly_app/page/ProductPage.dart';
import 'package:ly_app/page/TreasurePage.dart';
import 'package:ly_app/Routes.dart';
import 'package:ly_app/publicWidget/YYTabbarWidget.dart';
import 'package:ly_app/KeyboardFocusPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/routes":(BuildContext context) => new Routes(),
        "/keyboardFocus":(BuildContext context) => new KeyboardFocusPage()
      },
      home: new MainPageWidget(),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
//    return MainPageWidgetState();
    return NewMainPageWidgetState();
  }
}

class NewMainPageWidgetState extends State<MainPageWidget> {

  List<Widget> _tabItems;
  Widget _title = new Text("YYTabbarWidget");
  List<Widget> _tabViews;
  final PageController pageController = new PageController();

  final List<String> tabTitls = ["首页", "趋势", "财富", "我的"];

  var _tabImageSelectedNames = [
    'images/icon_tabbar_home_selected.png',
    'images/icon_tabbar_mine_selected.png',
    'images/icon_tabbar_mine_selected.png',
    'images/icon_tabbar_mine_selected.png',
  ];
  var _tabImageNormalNames = [
    'images/icon_tabbar_home_normal.png',
    'images/icon_tabbar_mine_normal.png',
    'images/icon_tabbar_mine_normal.png',
    'images/icon_tabbar_mine_normal.png',
  ];

  Image _initImage(String path) {
    return new Image.asset(path, width: 16.0, height: 16.0);
  }

  List<Widget> _initTabs() {
    List<Widget> tabs = [];
    for (var i = 0; i < tabTitls.length; i++) {
      var tab = new Container(
        width: 100.0,
        height: 40.0,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _initImage(_tabImageSelectedNames[i]),
            new Text(tabTitls[i], style: TextStyle(color: Colors.white, fontSize: 10.0))
          ],
        ),
      );
      tabs.add(tab);
    }
    return tabs;
  }

  void _initData() {
    _tabViews = [
      new HomePage(),
      new ProductPage(),
      new TreasurePage(),
      new MinePage(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return YYTabbarWidget(
      drawer: new Center(
        child: new Icon(IconData(0xe60e, fontFamily: "wxcIconFont")),
      ),
      title: _title,
      tabItems: _initTabs(),
      icons: [
        new Icon(Icons.add),
        new Icon(Icons.add),
        new Icon(Icons.add),
        new Icon(Icons.add)
      ],
      tabViews: _tabViews,
      pageController: pageController,
      onPageChanged: (index) {
//        Navigator.pushReplacementNamed(context, "/routes");
//        Navigator.pushNamed(context, "/routes");
      },
    );
  }
}

class MainPageWidgetState extends State<MainPageWidget> {
  var tabImages;
  var _tabImageSelectedNames = [
    'images/icon_tabbar_home_selected.png',
    'images/icon_tabbar_mine_selected.png',
    'images/icon_tabbar_mine_selected.png',
    'images/icon_tabbar_mine_selected.png',
  ];
  var _tabImageNormalNames = [
    'images/icon_tabbar_home_normal.png',
    'images/icon_tabbar_mine_normal.png',
    'images/icon_tabbar_mine_normal.png',
    'images/icon_tabbar_mine_normal.png',
  ];
  var appBarTitles = ['首页', '产品', '财富', '我的'];
  var _bodys;
  int _tabIndex = 0;
  List<BottomNavigationBarItem> _items = [];

  Image _initImage(String path) {
    return new Image.asset(path, width: 16.0, height: 16.0);
  }

  String _getCurrentPath(int currentIndex) {
    if (currentIndex == _tabIndex) {
      return _tabImageSelectedNames[currentIndex];
    } else {
      return _tabImageNormalNames[currentIndex];
    }
  }

  void _initData() {
    _bodys = [new HomePage(), new ProductPage(), new TreasurePage(), new MinePage(context)];

    List<BottomNavigationBarItem> items = [];
    for (var i = 0; i<_bodys.length; i++) {
      String path = _getCurrentPath(i);
      BottomNavigationBarItem item = new BottomNavigationBarItem(
          icon: _initImage(path),
          title: Text(appBarTitles[i], style: TextStyle(color: Colors.white))
      );
      items.add(item);
    }
    _items = items;
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return new Scaffold(
      body: _bodys[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}

