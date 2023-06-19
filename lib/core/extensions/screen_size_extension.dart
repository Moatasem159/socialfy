import 'package:flutter/widgets.dart';
extension MediaQueryValues on BuildContext{
  double getWidth({double w=1})=> MediaQuery.of(this).size.width / w;
  double getHeight({double h=1}) => MediaQuery.of(this).size.height / h;
}