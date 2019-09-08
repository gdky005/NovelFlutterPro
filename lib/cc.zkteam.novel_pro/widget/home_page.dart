/*
 * Created with Android Studio.
 * User: WangQing
 * Date: 2019-09-06
 * Time: 10:57
 * target: 主页面
 */

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/data/novel_list_data_entity.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/utils/toast.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/widget/novel_list.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/widget/test_widget.dart';

import 'custom_drawer.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _text = "";
  List _listData;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void _incrementCounter() {
    getHttp();
    setState(() {
      _counter++;
    });
  }

  void getHttp() async {
    try {
      Response response =
          await Dio().get("http://yapi.zkteam.cc/mock/52/Novel/jsonNovel");

      dynamic data = response.data;
      print(data);

      NovelListDataEntity novelListDataEntity =
          NovelListDataEntity.fromJson(data);
      List<NovelListDataResult> novelListData = novelListDataEntity.result;

      setState(() {
        _listData = novelListData;
        _text = novelListData[0].name;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("短小说"),
            centerTitle: true,
            actions: <Widget>[
              InkWell(
                onTap: () {
                  ZKToast.show(context, "点击了搜索功能");
                },
                child: AspectRatio(
                  child: Container(
                    child: Icon(Icons.search),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                  aspectRatio: 1,
                ),
              )
            ],
            bottom: TabBar(
                unselectedLabelColor: Colors.white54,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                tabs: [
                  Tab(icon: Icon(Icons.live_tv)),
                  Tab(icon: Icon(Icons.chrome_reader_mode)),
                ]),
          ),
          body: TabBarView(children: [
            TestWidget(_counter, _text),
            SafeArea(child: NovelList(_listData)),
          ]),
          drawer:CustomDrawer(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
