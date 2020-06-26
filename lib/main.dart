import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutterflame/box_game.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BoxGame boxGame = BoxGame();
  ///register tap event
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = boxGame.onTapDown;
  flameUtil.addGestureRecognizer(tapper);


  runApp(boxGame.widget);

}


