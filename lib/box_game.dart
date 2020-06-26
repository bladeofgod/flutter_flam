



import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class BoxGame extends Game{

  bool hasWon = false;


  Size screenSize;
  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    drawBg(canvas);
    drawTarget(canvas);
  }

  /// target rect
  drawTarget(Canvas canvas){
    double screenCenterX = screenSize.width/2;
    double screenCenterY = screenSize.height/2;
    Rect boxRect = Rect.fromLTWH(screenCenterX-75, screenCenterY-75, 150, 150);
    Paint boxPaint = Paint();
    if(hasWon){
      boxPaint.color = Colors.red;
    }else{
      boxPaint.color = Colors.white;
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  ///background
  drawBg(Canvas canvas){
    Rect bgRect = Rect.fromLTWH(0,0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Colors.black;
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double c) {

  }


  void onTapDown(TapDownDetails details){
    double screenCenterX = screenSize.width/2;
    double screenCenterY = screenSize.height/2;
    if(details.globalPosition.dx >= screenCenterX - 75
        && details.globalPosition.dx <= screenCenterX + 75
        && details.globalPosition.dy >= screenCenterY - 75
        && details.globalPosition.dy <= screenCenterY +75){
      hasWon = true;
    }else{
      hasWon = false;
    }
  }



}















