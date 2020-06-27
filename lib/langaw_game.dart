

import 'dart:math';

import 'package:flame/game/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutterflame/component/backyard.dart';
import 'package:flutterflame/component/credits_button.dart';
import 'package:flutterflame/component/help_button.dart';
import 'package:flutterflame/component/house_fly.dart';
import 'package:flutterflame/component/start_button.dart';
import 'package:flutterflame/controllers/fly_spawner.dart';
import 'package:flutterflame/view.dart';
import 'package:flutterflame/views/credits_view.dart';
import 'package:flutterflame/views/help_view.dart';
import 'package:flutterflame/views/home_view.dart';
import 'package:flutterflame/views/lost_view.dart';
import 'component/agile_fly.dart';
import 'component/drooler_fly.dart';
import 'component/fly.dart';
import 'component/hungry_fly.dart';
import 'component/muscle_fly.dart';


class LangawGame extends Game{

  List<Fly> flies;
  Backyard backyard;
  //scene
  View activeView = View.home;

  HomeView homeView;
  LostView lostView;
  HelpView helpView;
  CreditsView creditsView;

  StartButton startButton;
  HelpButton helpButton;
  CreditsButton creditsButton;



  FlySpawner flySpawner;

  LangawGame(){
    initialize();
  }

  Random random;

  void initialize()async{
    random = Random();
    flies = [];
    resize(await Flame.util.initialDimensions());
    flySpawner = FlySpawner(this);

    homeView = HomeView(this);
    lostView = LostView(this);
    helpView = HelpView(this);
    creditsView = CreditsView(this);

    startButton = StartButton(this);
    helpButton = HelpButton(this);
    creditsButton = CreditsButton(this);
    backyard = Backyard(this);


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

    if(activeView == View.home)homeView.render(canvas);
    if(activeView == View.lost) lostView.render(canvas);
    if(activeView == View.home || activeView == View.lost){
      startButton.render(canvas);
      helpButton.render(canvas);
      creditsButton.render(canvas);
    }

    if (activeView == View.help) helpView.render(canvas);
    if (activeView == View.credits) creditsView.render(canvas);

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
    flySpawner.update(c);
  }


  void spawnFly(){
    double x = random.nextDouble() * (screenSize.width - (tileSize*1.5*1.35));
    double y = random.nextDouble() * (screenSize.height - (tileSize*1.5*1.35));
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
    ///点击事件是否被消费
    bool isHandled = false;
    if(!isHandled && startButton.rect.contains(details.globalPosition)){
      if(activeView == View.home || activeView == View.lost){
        startButton.onTapDown();
        isHandled = true;
      }
    }
    ///reset help&credits
    if(!isHandled){
      if(activeView == View.help || activeView == View.credits){
        activeView = View.home;
        isHandled = true;
      }
    }


    // 教程按钮
    if (!isHandled && helpButton.rect.contains(details.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        helpButton.onTapDown();
        isHandled = true;
      }
    }

    // 感谢按钮
    if (!isHandled && creditsButton.rect.contains(details.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        creditsButton.onTapDown();
        isHandled = true;
      }
    }

    if(!isHandled){
      bool didHitAFly = false;
      flies.forEach((fly) {
        if(fly.flyRect.contains(details.globalPosition)){
          fly.onTapDown();
          isHandled = true;
          didHitAFly = true;
        }
      });
      if(activeView == View.playing && !didHitAFly){
        activeView = View.lost;
      }
    }
    ///help
    if(!isHandled && helpButton.rect.contains(details.globalPosition)){
      if(activeView == View.help || activeView == View.lost){
        helpButton.onTapDown();
        isHandled = true;
      }
    }


    ///credits
    if(!isHandled && creditsButton.rect.contains(details.globalPosition)){
      if(activeView == View.credits || activeView == View.lost){
        creditsButton.onTapDown();
        isHandled = true;
      }
    }


  }

}






















