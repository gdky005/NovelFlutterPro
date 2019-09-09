import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/Constants.dart';
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
              title: Text('详情页面'),
              leading: Icon(Icons.title),
              onTap: () {
                ZKToast.show(context, "详情页面");
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Constants.pageNovelDetail);
              },
            ),
            ListTile(
                title: Text('收藏',style: TextStyle(fontSize: 16)),
                leading: new Image.asset("images/collect.png",width:25,height:25),
                onTap: () {
                  Navigator.of(context).pop();
                  ZKToast.show(context, "收藏");
                }),
            ListTile(
                title: Text('设置',style: TextStyle(fontSize: 16)),
                leading: new Image.asset("images/setting.png",width:25,height:25),
                onTap: () {
                  Navigator.of(context).pop();
                  ZKToast.show(context, "设置");
                }),
            ListTile(
                title: Text('退出登录',style: TextStyle(fontSize: 16)),
                leading:new Image.asset("images/logout.png",width:25,height:25),
                onTap: () {
                  Navigator.of(context).pop();
                  ZKToast.show(context, "退出登录");
                }),
            AboutListTile(
                child:Text('关于',style: TextStyle(fontSize: 16)),
                icon: new Image.asset("images/about.png",width:25,height:25),
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
