import 'package:flutter/material.dart';

class ForgetPwdPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          child: SafeArea(
            top: true,
            child: Offstage(),
          ),
        ),
        body: Text("重置密码页面"));
  }
}
