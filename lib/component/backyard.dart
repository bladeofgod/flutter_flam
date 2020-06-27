


import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';

class Backyard with BaseComponent{
  final LangawGame game;
  Sprite bgSprite;

  Rect bgRect;

  Backyard(this.game){
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(0, game.screenSize.height-(game.tileSize*23),
        game.tileSize * 9, game.tileSize * 23);
  }

  @override
  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
  }

  @override
  void update(double c) {
    // TODO: implement update
  }



}