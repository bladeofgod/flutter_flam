

import 'package:flutter/material.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';

class Fly with BaseComponent{

  final LangawGame game;

  Rect flyRect;

  Paint flyPaint;

  bool isDead = false;

  bool isOutOffScreen = false;


  Fly(this.game,double x, double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xff6ab04c);
  }

  @override
  void render(Canvas c){
    c.drawRect(flyRect, flyPaint);
  }

  @override
  void update(double t){
    if(isDead){
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if(flyRect.top > game.screenSize.height){
        isOutOffScreen = true;
      }
    }
  }

  onTapDown(){
    isDead = true;
    flyPaint.color = Color(0xffff4757);
    game.spawnFly();
  }
}





















