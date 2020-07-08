

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';
import 'package:flutterflame/view.dart';

class Fly with BaseComponent{


  final LangawGame game;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  Rect flyRect;

  bool isDead = false;

  bool isOutOffScreen = false;

  double get speed => game.tileSize * 3;

  Offset targetLocation;
  void setTargetLocation(){
    double x = game.random.nextDouble() * (game.screenSize.width - (game.tileSize *1.5*1.35));
    double y = game.random.nextDouble() * (game.screenSize.height - (game.tileSize *1.5*1.35));
    targetLocation = Offset(x,y);
  }


  Fly(this.game){
    setTargetLocation();
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
    }else{
      flyingSpriteIndex += 30 *t;
      if(flyingSpriteIndex >= 2){
        flyingSpriteIndex -=2;
      }
      ///movement
      ///增量时间对应移动的距离
      double stepDistance = speed * t;
      ///距离目标的距离（矩形）
      Offset toTarget = targetLocation - Offset(flyRect.left,flyRect.top);
      if(stepDistance < toTarget.distance){
        Offset stepToTarget = Offset.fromDirection(toTarget.direction,stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      }else{
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
    }
  }

  onTapDown(){
    if(!isDead){
      isDead = true;
      if(game.activeView == View.playing){
        game.score +=1;
      }
    }

  }
}





















