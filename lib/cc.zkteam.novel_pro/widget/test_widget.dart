/*
 * Created with Android Studio.
 * User: WangQing
 * Date: 2019-09-06
 * Time: 10:53
 * target: 添加测试的 Widget
 */
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  final int _counter;
  final String _text;

  TestWidget(this._counter, this._text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.live_tv, size: 128, color: Colors.lightBlueAccent[700]),
          SizedBox(height: 100),
          Text(
            '计数器：',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
          Text("第一本短小说名字："),
          Text(_text, style: Theme.of(context).textTheme.body1),
        ],
      ),
    );
  }
}
