import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:novel_pro/cc.zkteam.novel_pro/widget/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        splashColor: Colors.white60,
        highlightColor: Colors.white30,
      ),
      supportedLocales: [Locale('zh', 'CN')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: HomePage(),
    );
  }
}
