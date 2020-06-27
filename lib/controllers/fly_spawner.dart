

import 'package:flutterflame/langaw_game.dart';

class FlySpawner{
  final LangawGame game;

  FlySpawner(this.game){
    start();
    game.spawnFly();
  }

  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 7;

  int currentInterval;
  int nextSpawn;

  void start(){
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll(){
    game.flies.forEach((element)=> element.isDead = true);
  }

  void update(double t){
    int nowTimeStamp = DateTime.now().millisecondsSinceEpoch;

    int livingFlies = 0;
    game.flies.forEach((element) {
      if(!element.isDead) livingFlies++;
    });

    if(nowTimeStamp >= nextSpawn && livingFlies < maxFliesOnScreen){
      game.spawnFly();
      if(currentInterval > minSpawnInterval){
        currentInterval -= intervalChange;
        currentInterval -=(currentInterval * 0.2).toInt();
      }
      nextSpawn = nowTimeStamp + currentInterval;
    }


  }

}













