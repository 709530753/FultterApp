
import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {

  String url;
  String title;


  WebViewPage(this.url, this.title);

  GlobalKey scaffoldKey = new GlobalKey();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      key: scaffoldKey,
      url: this.url,
      withLocalStorage:true,// 允许LocalStorage
      withJavascript:true,// 允许执行js代码
      clearCache: true,
      appBar: AppBar(
        title: Center(
          child: Text(this.title),
        ),
      ),
      );
  }

}