


import 'dart:ui';

import 'package:flame/sprite.dart';

import '../langaw_game.dart';
import 'fly.dart';

class MuscleFly extends Fly {
  final double scaleRatio = 1.5 * 1.35;

  MuscleFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * scaleRatio, game.tileSize * scaleRatio);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}