import 'package:flutter/material.dart';
import 'package:ly_app/page/RegisterPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPageWidget();
  }
}

class LoginPageWidget extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPageWidget> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginWidgetState();
  }
}

class LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(children: <Widget>[
        new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          new FlatButton(onPressed: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.close, color: Colors.white),
            padding: EdgeInsets.only(top: 34.0),)
        ],),
        new Container(
            child: new Text("朗瀛理财师",
                style: TextStyle(
                    fontSize: 36.0,
                    color: Colors.white)),
            padding: EdgeInsets.only(top: 74.0)
        ),
        new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new YYTextField(
                  leftIcon: Icon(Icons.phone_android, color: Colors.white),
                  rightIcon: new Icon(Icons.close, color: Colors.white),
                  placeHolder: '请输入你的姓名',
                ),
                padding: EdgeInsets.only(left: 48.0, right: 48.0, top: 74.0),
              ),
              new Container(
                child: new YYTextField(
                  leftIcon: Icon(Icons.pan_tool, color: Colors.white),
                  rightIcon: new Icon(Icons.close, color: Colors.white),
                  placeHolder: '请输入你的手机号',
                ),
                padding: EdgeInsets.only(left: 48.0, right: 48.0, top: 0.0),
              )
            ],
          ),
        ),
        new Container(
          width: MediaQuery.of(context).size.width - 48 * 2,
          padding: new EdgeInsets.only(top: 40.0),
          child: new RaisedButton(onPressed: (){

          },
            //设置控件的高度
            child: new Padding(padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: new Text("登录",
                  style: TextStyle(color: Colors.white)
              ),
            ),
            color: Colors.brown,
          ),
        ),
        new Container(
            width: MediaQuery.of(context).size.width - 48 * 2,
            margin: new EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    print("快速注册");
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                      return new RegisterPage();
                    }));

                  },
                  child: new Text("快速注册", style: TextStyle(color: Color(0XFFB2B2B2))),
                ),
                new GestureDetector(
                  onTap: () {
                    print("忘记密码");
                  },
                  child: new Text("忘记密码？", style: TextStyle(color: Color(0XFFB2B2B2))),
                ),
              ],
            )
        )
      ],
      ),
    ) ;


  }
}

class YYTextField extends StatefulWidget {
  final Icon leftIcon;
  final Icon rightIcon;
  final String placeHolder;

  YYTextField({
    Key key,
    this.leftIcon,
    this.rightIcon,
    this.placeHolder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _YYTextFieldState();
  }
}

class _YYTextFieldState extends State<YYTextField> {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new Container(
        child: Row(children: <Widget>[
          new Expanded(child:
            new TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 0.0, right: 10.0),
                icon: widget.leftIcon,
                border: InputBorder.none,
  //              labelText: '请输入你的姓名',
  //              helperText: '请输入你的真实姓名',
                hintText: widget.placeHolder,
                hintStyle: TextStyle(color: Colors.white54, fontSize: 12.0)
              ),
              onChanged: (t) {

              },
              autofocus: true,
              autocorrect: false,
            ),
          ),
          new Container(
            child: new FlatButton(
              child: widget.rightIcon,
              onPressed: () {

              },
              padding: EdgeInsets.all(0.0),
            ),
            width: 30.0,
            height: 30.0,
          ),
        ]
        )
      ),
      new Container(child:
        new Divider(color: Colors.white54),
        padding: EdgeInsets.only(left: 0.0, right: 0.0)
      )
    ],
    );
  }
}