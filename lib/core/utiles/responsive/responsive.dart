import 'package:flutter/cupertino.dart';

class AppSizeConfig {

  static late double height;
  static late double width;
  static late double appRatio;


  static void init(context){
    height = MediaQuery.of(context).size.height ;
    width = MediaQuery.of(context).size.width ;
    appRatio = (width / height);
  }
}