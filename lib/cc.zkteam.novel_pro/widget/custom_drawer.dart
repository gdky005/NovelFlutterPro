import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/data/user_entity.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/utils/toast.dart';

class CustomDrawer extends Drawer {
  UserEntity user;

  CustomDrawer({this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    currentAccountPicture: GestureDetector(
                        onTap: () {
                          ZKToast.show(context, "点击了头像");
                        },
                        child: ClipOval(
                          child: Image.network(
                            user.avatar,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        )),
                    accountName: Text(user.nickName),
                    accountEmail: Text(user.email),
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
        ));
  }
}
