


import 'dart:ui';

import 'package:flame/sprite.dart';

import '../langaw_game.dart';
import 'fly.dart';


class AgileFly extends Fly {
  final double scaleRatio = 1.5;
  AgileFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * scaleRatio, game.tileSize * scaleRatio);

    flyingSprite = List();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}