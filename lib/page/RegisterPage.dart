import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new RegisterWidget(),
    );
  }
}

class RegisterWidget extends StatefulWidget {
  RegisterWidgetState createState() => RegisterWidgetState();
}

class RegisterWidgetState extends State<RegisterWidget> {

  int _seconds = 0;

  String _verifyStr = '获取验证码';

  Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  _startTimer() {
    if (_verifyStr == '重新发送' || _verifyStr == '获取验证码') {
      _seconds = 5;

      _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        if (_seconds == 0) {
          _cancelTimer();
          return;
        }

        _seconds--;
        _verifyStr = '$_seconds(s)';
        setState(() {});
        if (_seconds == 0) {
          _verifyStr = '重新发送';
        }
      });
    }
  }

  _cancelTimer() {
    _timer?.cancel();
  }

  void _showAlertBottomButton() {
//    Botto
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(

      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new GestureDetector(onTap: () {
                    Navigator.pop(context);
                  },
                      child: new Icon(Icons.arrow_back, color: Colors.white)),
                  margin: new EdgeInsets.only(left: 20.0),
                ),
                new Container(
                  child: new Text("立即注册", style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  margin: new EdgeInsets.only(left: MediaQuery.of(context).size.width / 2 - 35.0 - 40.0),
                ),
              ],
            ),
            margin: new EdgeInsets.only(top: 34.0),
          ),
          new Container(
            child: new Text("燎原理财师", style: TextStyle(color: Colors.white, fontSize: 38.0)),
            margin: new EdgeInsets.only(top: 74.0),
          ),
          new Container(
            margin: EdgeInsets.only(left: 48.0, right: 48.0, top: 50.0),
            child: _codeTextField(),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 30.0),
            child: _bigButton("注册", 48.0, 48.0),
          ),
          new Container(
            margin: EdgeInsets.only(top: 14.0, left: 48.0),
            child: _protocolWidget(),
          )
        ],
      ),
    );
  }

  Widget _protocolWidget() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              print("选择");
            },
            child: Icon(Icons.add_alert, color: Colors.white),
          ),
          new Text.rich(
              new TextSpan(
                  text: '我已阅读并同意',
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    new TextSpan(
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          print("《燎原用户服务协议》");
                        },
                      text: "《燎原用户服务协议》",
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Color(0XFFB57A36),
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ]
              )
          ),
        ],
      )
    );
  }

  Widget _bigButton(String text, double lSpace, double rSpace) {
    return new Container(
      width: MediaQuery.of(context).size.width - lSpace - rSpace,
      height: 48.0,
      margin: new EdgeInsets.only(left: lSpace, right: rSpace),
      color: Colors.white54,
      padding: new EdgeInsets.only(top: 0.0),
      child: new RaisedButton(onPressed: (){
        print(text);
      },
        child: new Padding(padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: new Text(text,
              style: TextStyle(color: Colors.white)
          ),
        ),
        color: Colors.brown,
      ),
    );
  }

  Widget _mText(String text, double size) {
    return new Text(text, style: TextStyle(color: Colors.white, fontSize: size), textAlign: TextAlign.center);
  }

  Widget _codeTextField() {
    return new Column(
      children: <Widget>[
        new Container(
          height: 50.0,
//          color: Colors.white54,
          child: new Stack(
            children: <Widget>[
              new Align(
                  heightFactor: 4.0,
                  alignment: Alignment.bottomLeft,
                  child: new TextField(
                    autofocus: true,
                    autocorrect: true,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                    maxLength: 6,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter> [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      icon: new Icon(Icons.access_time, color: Colors.white),
                      contentPadding: new EdgeInsets.only(left: 0.0),
                      hintText: "输入验证码",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    onChanged: (t) {
                      print(t);
                    },
                  ),
              ),
              new Positioned(
                  right: 0.0,
                  top: 5.0,
                  child: new Container(
                    width: 80.0,
                    height: 27.0,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      border: new Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    child: InkWell(
                      child: _mText(_verifyStr, 12.0),
                      onTap: () {
                        _startTimer();
                      },
                    ),
                  )
              ),
              new Align(
                  heightFactor: 2.8,
                  alignment: Alignment.bottomLeft,
                  child: new Divider(color: Colors.white54)
              ),
            ],
          ),
        ),
      ],
    );
  }

}


