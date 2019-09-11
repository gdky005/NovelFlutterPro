import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/data/novel_detail_entity.dart';

class NovelDetailPage extends StatefulWidget {
  @override
  _NovelDetailPageState createState() => _NovelDetailPageState();
}

class _NovelDetailPageState extends State<NovelDetailPage> {
  BuildContext context;
  int _pid = 0;
  String _titleAndPid = "";
  String _title = "xxx 标题 xxx";
  String _detailText = "xxx 内容 xxx";
  String _author = "xxx 作者 xxx";

  void getData(int pid) async {
    try {
      Response response = await Dio()
          .get("http://yapi.zkteam.cc/mock/52/Novel/jsonSearch?pic=$pid");

      dynamic data = response.data;
      print(data);

      NovelDetailEntity novelDetailEntity = NovelDetailEntity.fromJson(data);
      NovelDetailResult novelDetailData = novelDetailEntity.result;

      setState(() {
        _title = novelDetailData.name;
        _author = novelDetailData.author;
        _detailText = novelDetailData.content;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

//    TODO 这里会一直执行，要放到合适的位置，这里只是兼容了一下。
    if (_pid == 0) {
      var args = ModalRoute.of(context).settings.arguments;
      print(args);

      if (args != null) {
        Map data = args as Map;
        _title = data["name"];
        _titleAndPid = "${data["name"]}(${data["pid"]})";
        _pid = int.parse(data["pid"]);
      }
      if (_pid == 0) {
        _pid = 1616023257;
      }
      getData(_pid);
    }

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            _titleAndPid,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
          ),
          elevation: 0.0,
        ),
        SliverSafeArea(
            sliver: SliverToBoxAdapter(
          child: _novelDetail(context),
        )),
      ],
    ));
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
        _title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _timeWidget() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
      child: Text(
        _author,
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _detailsWeb() {
    return Container(
      child: Text(
        _detailText,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
