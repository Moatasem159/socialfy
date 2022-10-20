import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder{
  final Widget page;
  SlideRight({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration( milliseconds :250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin=const Offset(1, 0);
      var end=const Offset(0, 0);
      var tween =Tween(begin: begin,end: end);
      var offsetAnimations=animation.drive(tween);
      return SlideTransition(position: offsetAnimations,child: child,);
    },
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );




}
class SlideLeft extends PageRouteBuilder{
  final Widget page;
  SlideLeft({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration( milliseconds :350),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin=const Offset(-1, 0);
      var end=const Offset(0, 0);
      var tween =Tween(begin: begin,end: end);
      var offsetAnimations=animation.drive(tween);
      return SlideTransition(position: offsetAnimations,child: child,);
    },
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );




}
class SlideUp extends PageRouteBuilder{
  final Widget page;
  SlideUp({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration( milliseconds :350),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin=const Offset(0, -1);
      var end=const Offset(0, 0);
      var tween =Tween(begin: begin,end: end);
      var offsetAnimations=animation.drive(tween);
      return SlideTransition(position: offsetAnimations,child: child,);
    },
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );




}
class SlideDown extends PageRouteBuilder{
  final Widget page;
  SlideDown({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration( milliseconds :350),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin=const Offset(0, 1);
      var end=const Offset(0, 0);
      var tween =Tween(begin: begin,end: end);
      var offsetAnimations=animation.drive(tween);
      return SlideTransition(position: offsetAnimations,child: child,);
    },
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );




}
class CustomCurve extends PageRouteBuilder{
  final Widget page;
  final Curve curve;
  final String routeName;
  final Duration transition;
  final Duration reverseTransition;
  CustomCurve( {required this.routeName,required this.transition,
    required this.reverseTransition,
    required this.curve,
   required this.page})
      : super(
    transitionDuration: transition,
    reverseTransitionDuration:reverseTransition,
    settings: RouteSettings(name:routeName),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin=const Offset(0, 1);
      var end=const Offset(0, 0);
      var tween =Tween(begin: begin,end: end);
      var curveAnimations=CurvedAnimation(parent: animation, curve:curve,);
      return SlideTransition(position: tween.animate(curveAnimations),child: child,);
    },
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );




}
