import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_kaoshibaodian/view/Login.dart';
import 'package:flutter_kaoshibaodian/view/Splash.dart';
import 'package:flutter_kaoshibaodian/view/WebView.dart';

void main() {
//打开视觉调试开关(布局有辅助线)
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
//      initialRoute: '/login',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPager(),
        '/webView': (context) => WebViewPager(),
      },
      title: '考试宝典',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
