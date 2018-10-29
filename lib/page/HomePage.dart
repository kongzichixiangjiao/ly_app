import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ly_app/Redux/YYRedux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ly_app/publicWidget/YYMarquee.dart';
import 'package:ly_app/net/PXRequest.dart';
import 'package:ly_app/Model/HomeNewMessageModel.dart';

import 'package:ly_app/page/AppointmentManagePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      print("--------$state---------");
    });
  }

  int kMoreViewCount = 2;

  final ScrollController _scrollController = new ScrollController();

  List data;

  List<int> datas = List.generate(20, (i) => i);

  List<String> images = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540457223305&di=5c9f853c120116bfba7abd0c04549226&imgtype=0&src=http%3A%2F%2Fpic22.nipic.com%2F20120621%2F1628220_155636709122_2.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540457325480&di=f43dfe3d9362a35f1e46f8460802753c&imgtype=0&src=http%3A%2F%2Fpic40.photophoto.cn%2F20160730%2F1155116399266298_b.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540457325480&di=f8fd080815a9163b3a1b64755e51300c&imgtype=0&src=http%3A%2F%2Fpic41.photophoto.cn%2F20161005%2F0832083651251356_b.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540457325479&di=f5f4b66e5227ecc3e58e43772f152432&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Df6d94878d7c451dae2fb04a8de943813%2F80cb39dbb6fd52663d1aec32a118972bd40736e7.jpg"
  ];
  List<Map> dataSource = [
    {
      'name': "市场活动",
      'list': [
        {
          'icon': new Icon(Icons.error),
          'title': "活动管理"
        }
      ],
    },
    {
      'name': "客户管理",
      'list': [
        {
          'icon': new Icon(Icons.add),
          'title': "预约管理"
        },
        {
          'icon': new Icon(Icons.message),
          'title': "报单管理"
        },
        {
          'icon': new Icon(Icons.title),
          'title': "沟通记录"
        },
        {
          'icon': new Icon(Icons.settings),
          'title': "我的客户"
        },
      ],
    },
    {
      'name': "产品管理",
      'list': [
        {
          'icon': new Icon(Icons.details),
          'title': "产品中心"
        },
        {
          'icon': new Icon(Icons.photo_size_select_small),
          'title': "信息披露"
        }
      ],
    },
    {
      'name': "咨询学习",
      'list': [
        {
          'icon': new Icon(Icons.zoom_out),
          'title': "每日分享"
        },
        {
          'icon': new Icon(Icons.cloud_queue),
          'title': "投研报告"
        },
        {
          'icon': new Icon(Icons.queue),
          'title': "精彩瞬间"
        }
      ],
    },
    {
      'name': "投研咨询（IC）",
      'list': [
        {
          'icon': new Icon(Icons.delete),
          'title': "投顾观点"
        },
        {
          'icon': new Icon(Icons.dehaze),
          'title': "实战演练"
        },
        {
          'icon': new Icon(Icons.dashboard),
          'title': "竞品分析"
        },
        {
          'icon': new Icon(Icons.data_usage),
          'title': "产品Q&A"
        }
      ],
    },

  ];

  HomeNewMessageModel _newMessageModel = HomeNewMessageModel.fromJson({"messageTitle":""});

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });

    WidgetsBinding.instance.addObserver(this);
    _requestNewMessage();
  }

  _requestNewMessage() async {
    HomeNewMessageModel model = await PXRequest.px_homeNewMessage();
    setState(() {
      _newMessageModel = model;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future _getMoreData() async {
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        datas.clear();
        datas = List.generate(30, (i) => i);
        return null;
      });
    });
  }

  Future<Null> _handleRefresh() async {
    _requestNewMessage();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new SpinKitRotatingCircle(color: Color(0xFF24292E)),
        ),
      ),
    );
  }

  Store<YYState> _getStore() {
    if (context == null) {
      return null;
    }
    return StoreProvider.of(context);
  }

  Widget _topView() {
    return new ConstrainedBox(
        child: new Swiper(
          outer:false,
          itemBuilder: (c, i) {
            return new Row(
              children: <Widget>[
                new Image.network(
                  images[i],
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            );
          },
          pagination: new SwiperPagination(
            margin: new EdgeInsets.all(5.0),
            builder: new DotSwiperPaginationBuilder(
              color: Colors.lightGreen,
              activeColor: Colors.brown,
              size: 5.0,
              activeSize: 7.0
            )
          ),
          itemCount: images.length,
        ),
        constraints:new BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, 150.0))
    );
  }

  Widget _scrollADView() {
      return new Container(
        color: Colors.black12,
        height: 40.0,
        child: new Card(
          margin: new EdgeInsets.only(left: 0.0, right: 0.0),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(new Radius.circular(0.0))
          ),
          child: new Container(
            padding: new EdgeInsets.only(top: 10.0),
            child: new YYMarquee(
                new Text(_newMessageModel.messageTitle == "" ? "暂无消息" : _newMessageModel.messageTitle),
                200.0,
                new Duration(seconds: 2),
                80.0),
          ),
        ),
      );
  }

  Widget _cell(int row) {
    if (row == 1) {
      return _scrollADView();
    }
    if (row == 0) {
      return _topView();
    }
    return new GestureDetector(
      child: new Container(
        height: 140.0,
        child: new Column(
          children: <Widget>[
            _cellSectionTitle(row - kMoreViewCount),
            new Container(
              margin: new EdgeInsets.only(left: 20.0, top: 20.0),
              child: new Row(
                children: _cellItems(row - kMoreViewCount),
              ),
            ),
            _cellLineView(row - kMoreViewCount),
          ],
        ),
      )
    );
  }

  Widget _cellSectionTitle(int row) {
    Map data = dataSource[row];
    String sectionTitle = data["name"];
    return new Row(
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.only(top: 20.0, left: 20.0),
          width: 3.0,
          height: 15.0,
          color: Color(0xFF777777),
        ),
        new Container(
          margin: new EdgeInsets.only(top: 19.0, left: 5.0),
          child: new Text(sectionTitle),
        )
      ],
    );
  }

  Widget _cellLineView(int row) {
    Widget line = new Container(
      margin: new EdgeInsets.only(top: 15.0),
      height: 10.0,
      color: Colors.black12,
    );

    if (row == dataSource.length - 1) {
      return Container();
    } else {
      return line;
    }
  }

  List<Widget> _cellItems(int row) {
    Map data = dataSource[row];
    List<Map> list = data["list"];

    List<Widget> items = [];
    double width = MediaQuery.of(context).size.width;

    for (var i = 0; i<list.length; i++) {
      Map itemData = list[i];
      String title = itemData["title"];
      Widget item = new GestureDetector(
        child: new Container(
          width: (width - 40.0) / 4.0,
          child: Column(
            children: <Widget>[
              itemData["icon"],
              new Container(
                margin: new EdgeInsets.only(top: 10.0),
                child: new Text(title),
              )
            ],
          ),
        ),
        onTap: () {
          print("--$i, $row, $title");
          if (title == "预约管理") {
            Navigator.of(context).push(new MaterialPageRoute(builder: (contrxt) {
              return AppointmentManagePage();
            }));
          }
        },
      );
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<YYState>(builder: (context, store) {
      return new RefreshIndicator(
        notificationPredicate: defaultScrollNotificationPredicate,
        child: new ListView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, row) {
            return _cell(row);
          },
          itemCount: dataSource.length + kMoreViewCount,
          controller: _scrollController,
        ),
        onRefresh: _handleRefresh,
      );
    });
  }
}
