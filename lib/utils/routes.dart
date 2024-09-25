import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/home/view/home_screen.dart';
import 'package:mirror_wall/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routes={
  '/':(context)=>SplashScreen(),
  'home':(context)=>HomeScreen(),
  'nointernet':(context)=>HomeScreen(),
};