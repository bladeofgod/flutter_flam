


import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';

class LostView with BaseComponent{

  final LangawGame game;

  Rect rect;
  Sprite sprite;

  LostView(this.game){
    rect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 5),
      game.tileSize * 7,
      game.tileSize * 5,
    );
    sprite = Sprite('bg/lose-splash.png');
  }

  @override
  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  @override
  void update(double c) {
    // TODO: implement update
  }

}