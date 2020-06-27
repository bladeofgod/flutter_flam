


import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';

class HomeView with BaseComponent{
  final LangawGame game;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.game){
    titleRect = Rect.fromLTWH(game.tileSize, (game.screenSize.height/2) - (game.tileSize * 4),
        game.tileSize * 7, game.tileSize * 4);
    titleSprite = Sprite('branding/title.png');
  }

  @override
  void render(Canvas canvas) {
    titleSprite.renderRect(canvas, titleRect);
  }

  @override
  void update(double c) {
    // TODO: implement update
  }
}