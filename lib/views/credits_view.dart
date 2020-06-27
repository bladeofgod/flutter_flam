

import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterflame/component/base_component.dart';

import '../langaw_game.dart';

class CreditsView with BaseComponent{

  final LangawGame game;
  Rect rect;
  Sprite sprite;

  CreditsView(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * .5,
      (game.screenSize.height / 2) - (game.tileSize * 6),
      game.tileSize * 8,
      game.tileSize * 12,
    );
    sprite = Sprite('ui/dialog-credits.png');
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