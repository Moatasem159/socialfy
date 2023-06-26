import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class MainBackButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  const MainBackButton({Key? key,this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()=>GoRouter.of(context).pop(),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(34,34)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
      ),
      child:  Icon(Icons.arrow_back_ios_rounded,size: 14,color: Theme.of(context).primaryColorLight,),
    );
  }
}


class MainButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final double radius;
  final Color color;
  const MainButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.width,
    required this.height, this.radius=7,
    required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)
            )),
            fixedSize: MaterialStateProperty.all(Size(width, height))),
        child: child);
  }
}
