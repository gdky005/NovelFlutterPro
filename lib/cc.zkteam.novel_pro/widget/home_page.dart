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
            NovelList(_listData),
          ]),
          drawer: Drawer(
              elevation: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DrawerHeader(
                    padding: EdgeInsets.all(0),
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(primaryColor: Colors.transparent),
                        child: UserAccountsDrawerHeader(
                          currentAccountPicture: ClipOval(
                            child: Image.network(
                                'https://www.gdky005.com/images/avatar.jpg',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover),
                          ),
                          accountName: Text('孤独狂饮'),
                          accountEmail: Text('741227905@qq.com'),
                        )),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567688759859&di=f00ae6e9b10ee3d5970b5f00567fce4f&imgtype=0&src=http%3A%2F%2Fimg.ph.126.net%2FlCFW6F0A46eced8IjrhWOQ%3D%3D%2F2570148012361858430.jpg"))),
                  ),
                  ListTile(
                    title: Text('测试 Item'),
                    leading: Icon(Icons.title),
                    onTap: () {
                      Navigator.of(context).pop();
                      ZKToast.show(context, "测试的 Item");
                    },
                  ),
                  ListTile(
                      title: Text('... 添加更多条 ...'),
                      leading: Icon(Icons.more_horiz),
                      onTap: () {
                        Navigator.of(context).pop();
                        ZKToast.show(context, "请添加更多 Item 吧");
                      }),
                  AboutListTile(
                      icon: Icon(Icons.nature_people),
                      applicationName: "短小说",
                      applicationVersion: "1.0.0",
                      applicationIcon: CircleAvatar(child: Icon(Icons.near_me)),
                      applicationLegalese: "协议",
                      aboutBoxChildren: [
                        ListTile(
                          title: Text('成员'),
                          leading: Icon(Icons.people),
                        ),
                      ]),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
