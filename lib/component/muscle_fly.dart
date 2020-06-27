


import 'package:flame/sprite.dart';

import '../langaw_game.dart';
import 'fly.dart';

class MuscleFly extends Fly {
  MuscleFly(LangawGame game, double x, double y) : super(game, x, y) {
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}