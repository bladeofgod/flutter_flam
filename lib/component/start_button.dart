


import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflame/component/base_component.dart';
import 'package:flutterflame/langaw_game.dart';

import '../view.dart';

class StartButton with BaseComponent{
  final LangawGame game;
  Rect rect;
  Sprite sprite;


  StartButton(this.game){
    rect = Rect.fromLTWH(game.tileSize * 1.5,
        (game.screenSize.height * 0.75 - (game.tileSize * 1.5)),
        game.tileSize * 6, game.tileSize * 3);
    sprite = Sprite('ui/start-button.png');
  }

  @override
  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  @override
  void update(double c) {
    // TODO: implement update
  }

  void onTapDown(){
    game.activeView = View.playing;
    game.flySpawner.start();
  }
}









