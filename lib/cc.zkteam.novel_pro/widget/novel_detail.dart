import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NovelDetailPage extends StatelessWidget {
  BuildContext context;
  String title;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    Map data = args as Map;
    title = "${data["name"]}(${data["pid"]})";

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            '详情',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
          ),
          elevation: 0.0,
        ),
        body: _novelDetail(context));
  }

  Widget _novelDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleWidget(),
            _timeWidget(),
            _detailsWeb(),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _timeWidget() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
      child: Text(
        '时间',
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _detailsWeb() {
    return Container(
      child: Html(data: '详情内容详情内容详情内容详情内容'),
    );
  }
}
