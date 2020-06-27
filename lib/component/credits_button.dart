

import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterflame/component/base_component.dart';

import '../langaw_game.dart';
import '../view.dart';

class CreditsButton with BaseComponent {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  CreditsButton(this.game) {
    rect = Rect.fromLTWH(
      game.screenSize.width - (game.tileSize * 1.25),
      game.screenSize.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
    sprite = Sprite('ui/icon-credits.png');
  }

  @override
  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.credits;
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}