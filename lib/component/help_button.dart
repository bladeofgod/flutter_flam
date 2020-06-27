


import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';

import '../view.dart';

class HelpButton with BaseComponent{
  final LangawGame game;

  Rect rect;
  Sprite sprite;

  HelpButton(this.game){
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.screenSize.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
    sprite = Sprite('ui/icon-help.png');
  }




  @override
  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  onTapDown(){
    game.activeView = View.help;
  }

  @override
  void update(double c) {
    // TODO: implement update
  }
}