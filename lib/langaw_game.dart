

import 'dart:math';

import 'package:flame/game/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutterflame/component/backyard.dart';
import 'package:flutterflame/component/house_fly.dart';
import 'component/agile_fly.dart';
import 'component/drooler_fly.dart';
import 'component/fly.dart';
import 'component/hungry_fly.dart';
import 'component/muscle_fly.dart';


class LangawGame extends Game{

  List<Fly> flies;
  Backyard backyard;

  LangawGame(){
    initialize();
  }

  Random random;

  void initialize()async{
    flies = [];
    resize(await Flame.util.initialDimensions());
    backyard = Backyard(this);
    random = Random();
    spawnFly();
  }


  Size screenSize;
  double tileSize;

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }


  @override
  void render(Canvas canvas) {
    drawBG(canvas);
    backyard.render(canvas);
    flies.forEach((element)=>element.render(canvas));
  }

  drawBG(Canvas canvas){
    Rect bgR = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgP = Paint();
    bgP.color = Color(0xFF576574);
    canvas.drawRect(bgR, bgP);
  }


  @override
  void update(double c) {
    flies.forEach((element)=>element.update(c));
    flies.removeWhere((element) => element.isOutOffScreen);
  }


  void spawnFly(){
    double x = random.nextDouble() * (screenSize.width - tileSize);
    double y = random.nextDouble() * (screenSize.height - tileSize);
    switch (random.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MuscleFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  void onTapDown(TapDownDetails details){
    flies.forEach((fly) {
      if(fly.flyRect.contains(details.globalPosition)){
        fly.onTapDown();
      }
    });
  }

}






















