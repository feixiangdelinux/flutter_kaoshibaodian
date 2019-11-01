import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kaoshibaodian/view/Login.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

//开屏页
class SplashPage extends StatelessWidget {
  Future requestPermission(BuildContext context) async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions(
            [PermissionGroup.storage, PermissionGroup.location]);

    // 申请结果
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    PermissionStatus permissionTwo = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if ((permission == PermissionStatus.granted) &&
        (permissionTwo == PermissionStatus.granted)) {
      print("权限申请通过");
      Observable.timer("啦啦啦", Duration(seconds: 3)).listen((data) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPager()),
//          MaterialPageRoute(builder: (context) => BlocDemo()),
//          new MaterialPageRoute(builder: (context) =>  TextFieldAndCheckPage()),
//          new MaterialPageRoute(builder: (context) =>  WebViewPager()),
            (route) => route == null);
      });
    } else {
      print("权限申请meisdfasdfa");
    }
  }

  @override
  Widget build(BuildContext context) {
//    applyPermission(context);
    //全屏
    SystemChrome.setEnabledSystemUIOverlays([]);
    requestPermission(context);
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: new Image.asset(
        "resource/images/welcome_d.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
