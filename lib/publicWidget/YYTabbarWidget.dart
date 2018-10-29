import 'package:flutter/material.dart';

class YYTabbarWidget extends StatefulWidget {
  List<Widget> tabItems = [];
  Widget title;
  List<Widget> tabViews = [];
  PageController pageController;
  final ValueChanged<int> onPageChanged;
  final Widget drawer;
  List<Icon> icons;
  List<String> titles;

  YYTabbarWidget({Key key,
    this.drawer,
    this.tabItems,
    this.title,
    this.tabViews,
    this.icons,
    this.titles,
    this.pageController,
    this.onPageChanged,
  }) : super(key: key);

  _YYTabbarWidgetState createState() => _YYTabbarWidgetState(
      drawer,
      title,
      tabItems,
      tabViews,
      pageController,
      icons,
      titles,
      onPageChanged
  );
}

class _YYTabbarWidgetState extends State<YYTabbarWidget> with SingleTickerProviderStateMixin {

  final Widget _title;
  final List<Widget> _tabViews;
  final List<Widget> _tabItems;
  final ValueChanged<int> _onPageChanged;
  final Widget _drawer;
  final List<Icon> _icons;
  final List<String> _titles;

  _YYTabbarWidgetState(
      this._drawer,
      this._title,
      this._tabItems,
      this._tabViews,
      this._pageController,
      this._icons,
      this._titles,
      this._onPageChanged,
      ) : super();

  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _renderTabItemChildren(int index) {
    if (_tabItems.length != 0) {
      return [_tabItems[index]];
    }
  }

  _renderTabItem(int index) {
    return new Container(
      width: 100.0,
      height: 40.0,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _renderTabItemChildren(index),
      ),
    );
  }

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < _tabItems.length; i++) {
      list.add(new FlatButton(
        onPressed: () {
        _pageController.jumpTo(MediaQuery
            .of(context)
            .size
            .width * i);
        },
        child: _renderTabItem(i),
      )
      );
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: _drawer,
      body: new PageView(
        controller: _pageController,
        children: _tabViews,
        onPageChanged: (index) {
          _tabController.animateTo(index);
          _onPageChanged?.call(index);
        },
    ),
      bottomNavigationBar: new Material(
        color: Colors.black,
        child: new TabBar(
          indicatorPadding: new EdgeInsets.only(top: 0.0),
          controller: _tabController,
          tabs: _renderTab(),
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}
