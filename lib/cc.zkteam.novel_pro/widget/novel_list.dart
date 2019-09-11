/*
 * Created with Android Studio.
 * User: WangQing
 * Date: 2019-09-06
 * Time: 10:37
 * target: 端小说列表
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/Constants.dart';
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
        itemBuilder: (BuildContext context, int index) {
          NovelListDataResult result = listData[index];
          String name = result.name;
          int pid = result.pid;

          String imageUrl2 =
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568183102466&di=2827d7547fe8119197c4fbbb64ae5e8d&imgtype=0&src=http%3A%2F%2Fimg0.ph.126.net%2FLAOaSm0b3Md5AthogSVHkg%3D%3D%2F6597931783773823770.jpg";
          String imageUrl =
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568183107835&di=22c5d258c18c1ccbcafa36303c1ef1cb&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180626%2Ff9d7c20596ce45d78b661c7d09d65e08.jpeg";
          return GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              color: Colors.white,
              margin: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.4), BlendMode.saturation)),
                ),
                child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${result.id}",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Divider(),
                        Text(
                          "${result.name}",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
//                    Text("${result.pid},"),

//                    Text("${result.url},"),
                      ],
                    )),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, Constants.pageNovelDetail,
                  arguments: <String, String>{
                    'name': name,
                    'pid': pid.toString(),
                  });
            },
          );
        });
  }
}
