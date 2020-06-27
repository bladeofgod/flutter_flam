
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflame/langaw_game.dart';

import 'fly.dart';

class HouseFly extends Fly{
  final double scaleRatio = 1.5;

  HouseFly(LangawGame game, double x, double y) : super(game){
    flyRect = Rect.fromLTWH(x, y, game.tileSize * scaleRatio, game.tileSize * scaleRatio);
    flyingSprite = [];
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }

}


















