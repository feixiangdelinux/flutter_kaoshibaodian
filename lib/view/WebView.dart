import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPager extends StatelessWidget {
  String url, title;

  WebViewPager({ @required this.title, @required this.url})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
              url: "https://www.baidu.com/",
              appBar: new AppBar(
                title: new Text("加载了百度"+url),
              ),
            ),
      },
    );
  }
}
