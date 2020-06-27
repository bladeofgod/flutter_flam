

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';

class Fly with BaseComponent{

  final LangawGame game;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  Rect flyRect;

  bool isDead = false;

  bool isOutOffScreen = false;


  Fly(this.game,double x, double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);

  }

  @override
  void render(Canvas canvas){
    if(isDead){
      deadSprite.renderRect(canvas, flyRect.inflate(2));
    }else{
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(canvas, flyRect.inflate(2));
    }

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
    game.spawnFly();
  }
}





















