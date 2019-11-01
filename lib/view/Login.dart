import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kaoshibaodian/view/ForgetPwd.dart';
import 'package:flutter_kaoshibaodian/view/Main.dart';
import 'package:flutter_kaoshibaodian/view/entity/user_login_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';

//登录页
class LoginPager extends StatelessWidget {
  /// 登录操作
  void postHttp(BuildContext context) async {
    //UserLoginBean

    var dio = Dio(BaseOptions(
      responseType: ResponseType.plain,
    ));
    try {
      Response response = await dio
          .post("https://slb-user-test.ksbao.com/api/user/userlogin", data: {
        "username": "17022209583",
        "password": md5.convert(utf8.encode("123456")).toString(),
        "clientType": "Android原生",
        "userAgent": "client_android"
      });
      Map userMap = json.decode(response.toString());
      var userLoginEntity = new UserLoginEntity.fromJson(userMap);
      if (userLoginEntity.status == 200) {
        Fluttertoast.showToast(
          msg: "登录成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainPager()),
            (route) => route == null);
      } else {
        Fluttertoast.showToast(
          msg: userLoginEntity.msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //显示手机顶部状态栏
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    //显示底部虚拟按键
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: SafeArea(
          top: true,
          child: Offstage(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(12.0, 20.0, 0.0, 0.0),
                child: Text(
                  "免费试用",
                  style: TextStyle(color: Color(0xFF444444), fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 12.0, 0.0),
                child: Text(
                  "快捷登录注册",
                  style: TextStyle(color: Color(0xFF444444), fontSize: 16),
                ),
              ),
            ],
          ),
          //中间的登录考试宝典控件
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
            //蓝湖字体颜色AHEX#FF5BB8FF就是0xFF5BB8FF
            child: Text("登录考试宝典",
                style: TextStyle(
                  color: Color(0xFF5BB8FF),
                  fontSize: 27,
                )),
          ),
          Container(
            height: 45.0,
            margin: EdgeInsets.fromLTRB(30.0, 90.0, 25.0, 0.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Image.asset(
                  "resource/images/login_iphone.png",
                  width: 18.0,
                  height: 18.0,
                ),
                hintText: "请输入账号/手机号",
              ),
            ),
          ),
          Container(
            height: 45.0,
            margin: EdgeInsets.fromLTRB(30.0, 30.0, 25.0, 0.0),
            child: Stack(
              children: <Widget>[
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Image.asset(
                      "resource/images/login_pwdhide.png",
                      width: 18.0,
                      height: 18.0,
                    ),
                    hintText: "请输入密码",
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 260.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: RawMaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: new Text(
                      '忘记密码?',
                      style: TextStyle(color: Color(0xFF444444), fontSize: 13),
                    ),
                    onPressed: () {
//                      Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginPager())
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new ForgetPwdPager()));
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 325.0,
            height: 45.0,
            margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: FlatButton(
              onPressed: () {
                postHttp(context);
              },
              child: Text(
                "登录",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              color: Color(0xFF5BB8FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
          ),
        ],
      ),
    );
  }
}
