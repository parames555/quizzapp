import 'package:flutter/material.dart';

class Screen{

  static bodyHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static bodyWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}