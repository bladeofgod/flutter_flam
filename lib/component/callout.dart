/*
* Author : LiJiqqi
* Date : 2020/7/8
*/


import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/painting.dart';

import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/component/fly.dart';

import '../view.dart';

class Callout with BaseComponent{

  final Fly fly;
  Rect rect;
  Sprite sprite;
  double value;

  TextPainter tp;
  TextStyle textStyle;
  Offset textOffset;


  Callout(this.fly){
    sprite = Sprite('ui/callout.png');
    value = 1;
    tp = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    );
    textStyle = TextStyle(
      color: Color(0xff000000),
      fontSize: 15,
    );
  }

  @override
  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    tp.paint(canvas, textOffset);

  }

  @override
  void update(double c) {
    if(fly.game.activeView == View.playing){
      value = value-0.5*c;
      if(value <=0){
        fly.game.activeView = View.lost;
      }
    }
    rect = Rect.fromLTWH(
      fly.flyRect.left - (fly.game.tileSize * .25),
      fly.flyRect.top - (fly.game.tileSize * .5),
      fly.game.tileSize * .75,
      fly.game.tileSize * .75,
    );
    tp.text = TextSpan(
        text: (value * 10).toInt().toString(),
        style: textStyle
    );
    tp.layout();
    textOffset = Offset(
        rect.center.dx - (tp.width / 2),
        rect.top + (rect.height * 0.4) - (tp.height / 2)
    );

  }

}












