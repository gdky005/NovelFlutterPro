import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/utils/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
      ),
      supportedLocales: [Locale('zh', 'CN')],
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String text = "";

  void _incrementCounter() {
    getHttp();
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void getHttp() async {
    try {
      Response response =
          await Dio().get("http://yapi.zkteam.cc/mock/52/Novel/jsonNovel");
      print(response);
      setState(() {
        dynamic data = response.data;
        text = data['result'][0]['name'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("短小说"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '计数器：',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text("第一本短小说名字："),
            Text(text, style: Theme.of(context).textTheme.body1),
          ],
        ),
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  child: Image.network("http://gdky005.com/images/avatar.jpg")),
              accountName: Text('孤独狂饮'),
              accountEmail: Text('741227905@qq.com'),
            ),
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
    );
  }
}