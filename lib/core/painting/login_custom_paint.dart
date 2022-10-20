import 'package:flutter/material.dart';

class CustomShapes extends StatelessWidget {


  const CustomShapes({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 70,
        width: double.infinity,
        child: ClipRect(
          child: CustomPaint(
            painter: RPSCustomPainter(),
          ),
        ),
      );
  }
}



class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.6000000,0);
    path0.quadraticBezierTo(size.width*0.4880000,size.height*0.0605000,size.width*0.4920000,size.height*0.2960000);
    path0.cubicTo(size.width*0.4972500,size.height*0.3475000,size.width*0.5442500,size.height*0.6430000,size.width*0.6420000,size.height*0.5840000);
    path0.cubicTo(size.width*0.6940000,size.height*0.6130000,size.width*0.6960000,size.height*0.5525000,size.width*0.8070000,size.height*0.5200000);
    path0.cubicTo(size.width*0.8587500,size.height*0.5890000,size.width*0.8752500,size.height*0.5930000,size.width*0.9070000,size.height*0.6960000);
    path0.quadraticBezierTo(size.width*0.9225000,size.height*0.7385000,size.width,size.height*0.8000000);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width*0.6000000,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

