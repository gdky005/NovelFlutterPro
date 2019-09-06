/*
 * Created with Android Studio.
 * User: WangQing
 * Date: 2019-09-06
 * Time: 10:37
 * target: 端小说列表
 */
import 'package:flutter/widgets.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/data/novel_list_data_entity.dart';

class NovelList extends StatefulWidget {
  final List<NovelListDataResult> listData;

  NovelList(this.listData);

  @override
  _NovelListState createState() => _NovelListState();
}

class _NovelListState extends State<NovelList> {
  @override
  Widget build(BuildContext context) {
    List<NovelListDataResult> listData = widget.listData;

    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listData == null ? 0 : listData.length,
        itemExtent: 30,
        itemBuilder: (BuildContext context, int index) {
          NovelListDataResult result = listData[index];
          return Text("${result.name},"
              " ${result.pid},"
              " ${result.id},"
              " ${result.url},");
        });
  }
}
