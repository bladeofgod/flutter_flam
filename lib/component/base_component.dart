



import 'package:flutter/material.dart';

abstract class BaseComponent{

  void render(Canvas canvas);

  ///param   t : time delta
  void update(double t);

}