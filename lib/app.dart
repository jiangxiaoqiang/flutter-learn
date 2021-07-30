import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';

class LearnApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget.title"),
      ),
      body: SafeArea(

        child: Html(
          //data: "<p><img src=\"https://tva1.sinaimg.cn/mw690/6dd57921ly1grqsvwx478g2066088e82.gif\" /></p>",
            data: "<p><img src=\"https://tva1.sinaimg.cn/mw690/006v119zly1gsu8ni6jbbg30a007q1l2.gif\" /></p>"
        ),
      ),
    );
  }

}
