import 'package:flutter/material.dart';

class MainBackButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  final Color ?color;

  const MainBackButton({Key? key,this.onPressed, this.color,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.of(context).pop();

    },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(34,34)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(color)
      ),
      child:  Icon(Icons.arrow_back_ios_rounded,size: 14,color: Theme.of(context).iconTheme.color,),
    );
  }
}




class MainButton extends StatelessWidget {
  final  VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  const MainButton({Key? key, required this.onPressed, required this.child, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(MediaQuery
                    .of(context)
                    .size
                    .width - width, height))),
        child: child);
  }
}
