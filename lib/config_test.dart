import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LearnApp extends HookWidget {

  var gifUrl = "https://tva1.sinaimg.cn/mw690/006v119zly1gsu8ni6jbbg30a007q1l2.gif";

  Widget load() {
    Completer<Size> completer = Completer();
    Image image = Image.network(gifUrl,
        frameBuilder: (ctx, child, frame, _) {
      if (frame == null) {
        if (!completer.isCompleted) {
          completer.completeError("error");
        }
        return child;
      } else {
        return child;
      }
    });

    ImageStreamListener listener = ImageStreamListener((ImageInfo image, bool synchronousCall) {
      var myImage = image.image;
      Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
      if (!completer.isCompleted) {
        completer.complete(size);
      }
    }, onError: (object, stacktrace) {
      if (!completer.isCompleted) {
        completer.completeError(object);
      }
    });

    image.image.resolve(ImageConfiguration()).addListener(
          listener
        );

    var fb = FutureBuilder<Size>(
      future: completer.future,
      builder: (BuildContext buildContext, AsyncSnapshot<Size> snapshot) {
        if (snapshot.hasData) {
          return Image.network(
            gifUrl,
            frameBuilder: (ctx, child, frame, _) {
              if (frame == null) {
                return Text("dd");
              }
              return child;
            },
          );
        } else if (snapshot.hasError) {
          return Text("error");
        } else {
          return Text("dd");
        }
      },
    );
    if(completer.isCompleted) {
      image.image.resolve(ImageConfiguration()).removeListener(listener);
    }
    return fb;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget title"),
      ),
      body: SafeArea(child: load()),
    );
  }
}
