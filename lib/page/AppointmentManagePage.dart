import 'package:flutter/material.dart';
import 'package:ly_app/publicWidget/YYScrollPagingWidget.dart';

class AppointmentManagePage extends StatefulWidget {
  AppointmentManagePageState createState() => AppointmentManagePageState();
}

class AppointmentManagePageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("AppointmentManagePage"),
        ),
        body: new Center(
          child: new YYScrollPagingWidget(3),
        ),
      ),
    );
  }
}