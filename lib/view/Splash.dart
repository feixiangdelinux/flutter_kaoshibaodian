import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kaoshibaodian/view/Login.dart';
import 'package:flutter_kaoshibaodian/view/bloc_demo.dart';
import 'package:rxdart/rxdart.dart';

//开屏页
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //全屏
    SystemChrome.setEnabledSystemUIOverlays([]);
    Observable.timer("啦啦啦", Duration(seconds: 3)).listen((data) {
      Navigator.pushAndRemoveUntil(
          context,
//          MaterialPageRoute(builder: (context) => LoginPager()),
          MaterialPageRoute(builder: (context) => BlocDemo()),
//          new MaterialPageRoute(builder: (context) =>  TextFieldAndCheckPage()),
//          new MaterialPageRoute(builder: (context) =>  WebViewPager()),
          (route) => route == null);
    });

    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: new Image.asset(
        "resource/images/welcome_d.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
